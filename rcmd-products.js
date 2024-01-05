const CDP = require('chrome-remote-interface')

const username = process.argv[2]

if (!username) {
    throw Error('require username')
}

const sleep = (s) => new Promise(r => setTimeout(() => r(), s * 1000))

const run = async () => {
    let client

    try {
        client = await CDP({
            host: '0.0.0.0',
            port: 9222,
        })

        const { Network, Page, Runtime, DOM, ServiceWorker } = client

        Network.requestIntercepted(async ({ interceptionId }) => {
            Network.continueInterceptedRequest({
                interceptionId,
            });

        });

        Network.responseReceived(async ({ requestId, response }) => {
            if (response.url.search('rcmd_items') > -1) {
                const { body } = await Network.getResponseBody({ requestId })
                console.log(JSON.stringify(JSON.parse(body), null, 2))
                process.exit(0)
            }
        })

        await Network.enable()
        await Page.enable()
        await Runtime.enable()
        await DOM.enable()
        await ServiceWorker.enable()

        await Page.navigate({ url: `https://shopee.co.th/${username}` })

        await sleep(10)
    } catch (err) {
        console.error(err)
    } finally {
        if (client) {
            await client.close()
        }
    }
}

run()
