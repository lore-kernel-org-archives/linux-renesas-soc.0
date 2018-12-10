Return-Path: <linux-arm-kernel-bounces+geert=linux-m68k.org@lists.infradead.org>
From: Peter Rosin <peda@axentia.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [RFC/RFT 10/10] i2c: rcar: add suspend/resume support
Date: Mon, 10 Dec 2018 21:52:07 +0000
Message-ID: <944a2523-aa40-eaf2-2c4a-d27254e7cbca@axentia.se>
References: <20181210210310.12677-1-wsa+renesas@sang-engineering.com>
 <20181210210310.12677-11-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181210210310.12677-11-wsa+renesas@sang-engineering.com>
Content-Language: en-US
Content-ID: <982E3174F51E754C9161B38295326863@eurprd02.prod.outlook.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+geert=linux-m68k.org@lists.infradead.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-12-10 22:03, Wolfram Sang wrote:
> Because the adapter will be set up before every transaction anyhow, we
> just need to mark it as adapted to the I2C core.

mark it as "suspended", not "adapted"?

Cheers,
Peter

> 
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-rcar.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index 254e6219e538..30cff066e0da 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -1017,10 +1017,35 @@ static int rcar_i2c_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_PM_SLEEP
> +static int rcar_i2c_suspend(struct device *dev)
> +{
> +	struct rcar_i2c_priv *priv = dev_get_drvdata(dev);
> +
> +	i2c_mark_adapter_suspended(&priv->adap, true);
> +	return 0;
> +}
> +
> +static int rcar_i2c_resume(struct device *dev)
> +{
> +	struct rcar_i2c_priv *priv = dev_get_drvdata(dev);
> +
> +	i2c_mark_adapter_suspended(&priv->adap, false);
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(rcar_i2c_pm_ops, rcar_i2c_suspend, rcar_i2c_resume);
> +
> +#define DEV_PM_OPS (&rcar_i2c_pm_ops)
> +#else
> +#define DEV_PM_OPS NULL
> +#endif /* CONFIG_PM_SLEEP */
> +
>  static struct platform_driver rcar_i2c_driver = {
>  	.driver	= {
>  		.name	= "i2c-rcar",
>  		.of_match_table = rcar_i2c_dt_ids,
> +		.pm	= DEV_PM_OPS,
>  	},
>  	.probe		= rcar_i2c_probe,
>  	.remove		= rcar_i2c_remove,
> 

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
