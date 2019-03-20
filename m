Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99120C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 14:41:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58A9D2184E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 14:41:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="LhdUlTMK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfCTOlo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 10:41:44 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34977 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbfCTOln (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 10:41:43 -0400
Received: by mail-lj1-f196.google.com with SMTP id t13so2484522lji.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2019 07:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=SftzLy4vVzz0ESS7WWD4EPOi9x0R0p/+MXLHujE4fL4=;
        b=LhdUlTMK0ohcDTSnvZDPGzuL10Lftg2IJSgsXpa7MCpcolmH+L5u7j3D/NfQpVPvFa
         kyATy+DompNSlVhSgrq775X7RTSYsoX5bQVztCGkuMD+3VQeGwLDsoJcuOiAc5V9JhMz
         bpC2emFPVOzMkTjyEqngx0/FYCMiMFF//KZOk+i5wj8pBgQLJRV50l8SDVWXOh/lB4Lx
         kQd1E+Vrmu4EkzP6TA4gQTdSndHf8+fYMyXtsByzxFHUoMuFNbwTvdFjHH/S2jMbULWy
         sTbRsnpbdE1Xtwtw7E1umNKfI4UzztBy8N0ZjPM5cppXDdhAw7Mh4BkQ+WHHJ7423H2g
         CzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=SftzLy4vVzz0ESS7WWD4EPOi9x0R0p/+MXLHujE4fL4=;
        b=XigZBGGeYDml7mK3P07lHZ8XjPAdRpcOHnCeT9xc3qtfUEr3aKHRl1U5uQS3Z64p68
         tV/rZFvOJW0C1k1qGXl3KA7nuccmFrWHqN47NjCOEP53UNHqqHk6o4xQNvQQ86WmX6yh
         ODBFEAKIKaWt0nyXMvBMhpt6s3zwdzvQF5saIs7frmr3sdBceFCipqYUWwi+K8EjIWFL
         rGB51esDc4zEqhxvw7QLFsywh+SwqNxO5XKo6Sb5GjN7Yl0lxIazOk/8QS/qzsGtouys
         VA0z3aMbJhISmDXolAjl6QUD4H3jyvfXwOpgbdsDQFIzig9fdUnk+2p/i41x1hDw/vR2
         8rtA==
X-Gm-Message-State: APjAAAUHGMgCXp53RZPaQluW8ppxNlIrDqQt0w2xtWubJ6d3SHhULju/
        K8IK70DgNUJRTCegEfD9tumBSw==
X-Google-Smtp-Source: APXvYqwqsPADpUjrw3w1NII/N/07aAbNbvuOLpAew60wvs+VsMBW01MaueHejigIhTrGH+yC3DL12w==
X-Received: by 2002:a2e:998d:: with SMTP id w13mr9074404lji.110.1553092901767;
        Wed, 20 Mar 2019 07:41:41 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id k5sm371437lja.78.2019.03.20.07.41.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Mar 2019 07:41:41 -0700 (PDT)
Date:   Wed, 20 Mar 2019 15:41:40 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sh-pfc: Improve PINMUX_IPSR_PHYS() documentation
Message-ID: <20190320144140.GK26015@bigcity.dyn.berto.se>
References: <20190320104446.21833-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190320104446.21833-1-geert+renesas@glider.be>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-03-20 11:44:46 +0100, Geert Uytterhoeven wrote:
>   - The IPSR field is meant for documentation only,
>   - The function name refers to the pin function, not to the IPSR field.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in sh-pfc-for-v5.2.
> 
>  drivers/pinctrl/sh-pfc/sh_pfc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
> index 2a6abeb62bab659b..7db5819eea7e6e0d 100644
> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -418,8 +418,8 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
>  /*
>   * Describe a pinmux configuration in which a pin is physically multiplexed
>   * with other pins.
> - *   - ipsr: IPSR field
> - *   - fn: Function name, also referring to the IPSR field
> + *   - ipsr: IPSR field (unused, for documentation purposes only)
> + *   - fn: Function name
>   *   - psel: Physical multiplexing selector
>   */
>  #define PINMUX_IPSR_PHYS(ipsr, fn, psel) \
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
