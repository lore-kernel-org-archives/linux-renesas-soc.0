Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:46004 "HELO
        cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with SMTP id S1756826AbcINA4z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2016 20:56:55 -0400
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Viresh Kumar <viresh.kumar@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] cpufreq: dt: Add support for r8a7792
Date: Wed, 14 Sep 2016 03:03:02 +0200
Message-ID: <2288419.pXvv2aYonF@vostro.rjw.lan>
In-Reply-To: <20160907050259.GL27345@vireshk-i7>
References: <1473164300-22017-1-git-send-email-geert+renesas@glider.be> <20160907050259.GL27345@vireshk-i7>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wednesday, September 07, 2016 10:32:59 AM Viresh Kumar wrote:
> On 06-09-16, 14:18, Geert Uytterhoeven wrote:
> > Add the compatible string for supporting the generic cpufreq driver on
> > the Renesas R-Car V2H (r8a7792) SoC.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Untested due to lack of hardware.
> > ---
> >  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> > index 285ed3e6494e9d22..276378a43321a4e0 100644
> > --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> > +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> > @@ -52,6 +52,7 @@ static const struct of_device_id machines[] __initconst = {
> >  	{ .compatible = "renesas,r8a7779", },
> >  	{ .compatible = "renesas,r8a7790", },
> >  	{ .compatible = "renesas,r8a7791", },
> > +	{ .compatible = "renesas,r8a7792", },
> >  	{ .compatible = "renesas,r8a7793", },
> >  	{ .compatible = "renesas,r8a7794", },
> >  	{ .compatible = "renesas,sh73a0", },
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied.

Thanks,
Rafael
