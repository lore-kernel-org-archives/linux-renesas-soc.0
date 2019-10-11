Return-Path: <SRS0=35Fo=YE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E51C47404
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Oct 2019 12:39:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28B28214E0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Oct 2019 12:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570797561;
	bh=9IFX/RKN1huxZI4n7EziNDwmne/xeStomNsEoSl8ibE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=phSuk5oXKHbhx+gRJODHwvgOTFoR6sWEXrzoWSajtouIGCv5NKDc4RqEJLfUhbLHx
	 rPfSQJvXywfab0xek6nkygRB6r0yNltEHwyEYbRcf4uyqgBaV47PV/i1/XbhNexv3j
	 RQ/2Aw1CGFoifCFUkeQdnva4PGv9wsUOVaR1DzNc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbfJKMjU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Oct 2019 08:39:20 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40314 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbfJKMjU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Oct 2019 08:39:20 -0400
Received: by mail-oi1-f194.google.com with SMTP id k9so7849800oib.7;
        Fri, 11 Oct 2019 05:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=D3dmZ8LIotWz+dGLUdBZg727TLIV2DEHoYLVl9tR/Xc=;
        b=JmKqor4Xd0b8h/AeUhwiBmSD8tR4UtsqL9aZaqHYH4GbDuKYUDCe83/yStjKUeyYTe
         D9xBnTR2K3ZnTf6RYKxLLn/MzJAACJbu622cPQenohyBiVctkTG1SdyDB2Y2JBrZWMZq
         BwOlTgN0Zm/2VZW2XetnTdNrTcf2JwgKxijn8GQwG7/j2A1PG2nVCekWsLUNvwad9TOp
         WtjbBd0hL3NYs6+dMnIXI3MJOAKBYxWZasQgbH0/Fm7kLMLlAmOisbuOq68f/GSSLtJn
         yOorrA08RKS4b968Y1PQUMjpmy+CtCmdGGeQD04EQmEaOpKiT0mZagvSlI06XDDF2m9x
         3rRA==
X-Gm-Message-State: APjAAAXCfU6ItFAxFRotI01xpFx8kLUlYCZKq36adVMjaz0yTf7Ukcvx
        WxF6RTYJEuhIhhyg/ozJiuvYthw=
X-Google-Smtp-Source: APXvYqxbIoAAzJTedywiREhc6OCrL5oSoJyNJ7T6bsscApSUKuiMhbtrPK471t8BTbwiv8Yk8+ze0g==
X-Received: by 2002:aca:b154:: with SMTP id a81mr10653817oif.142.1570797558018;
        Fri, 11 Oct 2019 05:39:18 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w20sm2661651otk.73.2019.10.11.05.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 05:39:17 -0700 (PDT)
Date:   Fri, 11 Oct 2019 07:39:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: timer: renesas, cmt: Document r8a774b1
 CMT support
Message-ID: <20191011123916.GA13450@bogus>
References: <1570104229-59144-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570104229-59144-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Oct 03, 2019 at 01:03:49PM +0100, Biju Das wrote:
> Document SoC specific bindings for RZ/G2N (r8a774b1) SoC.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> V1-->V2
>  * Rebased to tip/timers 
> ---
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
