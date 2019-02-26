Return-Path: <SRS0=APCG=RB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B79C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 26 Feb 2019 11:12:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7EAC72146F
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 26 Feb 2019 11:12:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="TTqiPmow"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbfBZLMJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 26 Feb 2019 06:12:09 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:34716 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbfBZLMJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Feb 2019 06:12:09 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id F36D025BEDD;
        Tue, 26 Feb 2019 22:12:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551179526; bh=qnwI/0alqZEYK/gkI1eo7v2xcn+MnGArnWiNsz0Osps=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TTqiPmowK+/A1BK2yh6rsWNpDz6XCuXNQdkgbPsOGEgGCxxkUuuDv7/ImzGEAi2fZ
         T/EPka+r5eaOU5OACw4JfWIfwjUeVnVpqf5/Rt4SQgCFNShiBC9Q+83wHsPq1MCU2K
         EVj1GWrgxGDcqtl6zFX/O1a/vxGoEff2d431YpO0=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4D1EA940373; Tue, 26 Feb 2019 12:12:04 +0100 (CET)
Date:   Tue, 26 Feb 2019 12:12:04 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-pm@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFT] thermal: rcar_thermal: update calculation formula
 for E3
Message-ID: <20190226111201.6hic7q4uqohrhxb5@verge.net.au>
References: <1551127558-28916-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1551127558-28916-1-git-send-email-ykaneko0929@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 26, 2019 at 05:45:58AM +0900, Yoshihiro Kaneko wrote:
> HW manual changes temperature calculation formula for E3:

Thanks Kaneko-san,

I think it would be good do describe this patch not just in terms of E3.
Of the IP versions supported by the driver I believe this effects:

  R-Car V3M (r8a77970)
  R-Car E3 (r8a77990)
  R-Car D3 (r8a77995)
  RZ/G2E (r8a774c0)

> - When CTEMP is less than 24
>    T = CTEMP[5:0] * 5.5 - 72
> - When CTEMP is equal to/greater than 24
>    T = CTEMP[5:0] * 5 - 60
> 
> This was inspired by a patch in the BSP by Van Do <van.do.xw@renesas.com>
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
> 
> This patch is based on the master branch of Linus Torvalds's linux tree.
> 
>  drivers/thermal/rcar_thermal.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

Using renesas-devel-20190225-v5.0-rc8 on an E3 based Ebisu board, I see:

# cat /sys/devices/virtual/thermal/thermal_zone0/temp
25000
# N=1; while [ $N -lt 1000000 ]; do N=$(($N + 1)); done & \
  N=1; while [ $N -lt 1000000 ]; do N=$(($N + 1)); done & \
  wait; \
  cat /sys/devices/virtual/thermal/thermal_zone0/temp
30000

And with this patch applied on top of renesas-devel-20190225-v5.0-rc8 I see:

# cat /sys/devices/virtual/thermal/thermal_zone0/temp
27000
# N=1; while [ $N -lt 1000000 ]; do N=$(($N + 1)); done & \
  N=1; while [ $N -lt 1000000 ]; do N=$(($N + 1)); done & \
  wait; \
  cat /sys/devices/virtual/thermal/thermal_zone0/temp
32000

I see the same, 27000/32000, result when running the test on
BSP v3.9.3-rc1, which includes Van Do's work.

The E3 has 2 cores

Tested-by: Simon Horman <horms+renesas@verge.net.au>

> diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
> index 97462e9..11df0cc 100644
> --- a/drivers/thermal/rcar_thermal.c
> +++ b/drivers/thermal/rcar_thermal.c
> @@ -52,6 +52,7 @@ struct rcar_thermal_chip {
>  	unsigned int irq_per_ch : 1;
>  	unsigned int needs_suspend_resume : 1;
>  	unsigned int nirqs;
> +	unsigned int ctemp_bands;
>  };
>  
>  static const struct rcar_thermal_chip rcar_thermal = {
> @@ -60,6 +61,7 @@ struct rcar_thermal_chip {
>  	.irq_per_ch = 0,
>  	.needs_suspend_resume = 0,
>  	.nirqs = 1,
> +	.ctemp_bands = 1,
>  };
>  
>  static const struct rcar_thermal_chip rcar_gen2_thermal = {
> @@ -68,6 +70,7 @@ struct rcar_thermal_chip {
>  	.irq_per_ch = 0,
>  	.needs_suspend_resume = 0,
>  	.nirqs = 1,
> +	.ctemp_bands = 1,
>  };
>  
>  static const struct rcar_thermal_chip rcar_gen3_thermal = {
> @@ -80,6 +83,7 @@ struct rcar_thermal_chip {
>  	 * interrupts to detect a temperature change, rise or fall.
>  	 */
>  	.nirqs = 2,
> +	.ctemp_bands = 2,
>  };
>  
>  struct rcar_thermal_priv {
> @@ -263,7 +267,12 @@ static int rcar_thermal_get_current_temp(struct rcar_thermal_priv *priv,
>  		return ret;
>  
>  	mutex_lock(&priv->lock);
> -	tmp =  MCELSIUS((priv->ctemp * 5) - 65);
> +	if (priv->chip->ctemp_bands == 1)
> +		tmp =  MCELSIUS((priv->ctemp * 5) - 65);
> +	else if (priv->ctemp < 24)
> +		tmp = MCELSIUS(((priv->ctemp * 55) - 720) / 10);
> +	else
> +		tmp = MCELSIUS((priv->ctemp * 5) - 60);
>  	mutex_unlock(&priv->lock);
>  
>  	if ((tmp < MCELSIUS(-45)) || (tmp > MCELSIUS(125))) {
> -- 
> 1.9.1
> 
