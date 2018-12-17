Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE80C43612
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:46:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D6282146F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:46:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="jyx+Q2+w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733001AbeLQOqg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:46:36 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39187 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731785AbeLQOqg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:46:36 -0500
Received: by mail-lj1-f194.google.com with SMTP id t9-v6so11206839ljh.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Dec 2018 06:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=IKjqwucKL4E+Hu69dysnFKf8kEB1cGNkWK5BxEiU9uU=;
        b=jyx+Q2+wPG9VoNAu55qj1kgOoQ85xCL8tuNoGXbISZZOYT+r7j1kXB+UWYNIrwYHJG
         39R+qqOvWMWSzOX7NC+rxKYimLAAigrM9yw6jndPFZd9WiKOtRDK/eNd9jiKXSFYj6th
         mXdVn/3fzZxT2b+Ob6vKN+e8WyZ2/OMTmy7WLD5mYMgiV1TTMud6aKIHrn05m78Dy+oU
         hphQ9J7AO0ELlm0M4CMCUm+brJGtGHNLlFjBSL6xGX8lPDjD0sstot0GT8GKuC86H6N/
         K7QYAwN/7exoG2EPyrTgcTpN5924UAQZVXBV6tQPJgq5sQ5rRALbKJ2cZwEifUgtJwMY
         ys4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=IKjqwucKL4E+Hu69dysnFKf8kEB1cGNkWK5BxEiU9uU=;
        b=FgMfbZfvdnzZtgwg3a4ZE/w1XI3+Eb2afCtpqCt/I9PMg5bTq6jiM45/ojzBjtGg6M
         F6MFkqC2Zax9mBhbafGCXUZLAXY+FcVyv/euxadJi8hrOgNuGkMcmFlxkhcXWYm+ighk
         SCjzV472lloNL8M7vrR3fFzsHr4hn05mYDg60hTS3nRlvagxVoMoHgGn0ve0k8EAYj/H
         DTt8co6jUhZgajou/tmwzYYP2zcvb3DXdNNiSb9u6R1vjyNLl7vdzrtRHOetsMEfMGNW
         A4KcY0ZMtm7fdBeHcOY/cDLDUTzDTQ5sZHSAIvN8rkB28lRimJklrgNtSVe0Vl15Nu0q
         n70g==
X-Gm-Message-State: AA+aEWZyDq3UA1gFCb2srsinJJ4P4kitGvPmbt8A2jIsJyc+x8r3ac2l
        BmDXA+pr2xtHwNvj3+JN2Ccd/w==
X-Google-Smtp-Source: AFSGD/V+6nTYOjj0lVuCVH/o5JcGOAMwDL8buyqcphZxy8yswO5O9pRcI3OcRroPbeDcOV7NvsFEsQ==
X-Received: by 2002:a2e:1b47:: with SMTP id b68-v6mr6533479ljb.104.1545057993923;
        Mon, 17 Dec 2018 06:46:33 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id f11sm2752335lfi.12.2018.12.17.06.46.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Dec 2018 06:46:33 -0800 (PST)
Date:   Mon, 17 Dec 2018 15:46:32 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] media: dt-bindings: rcar-csi2: Add r8a774c0
Message-ID: <20181217144632.GQ17972@bigcity.dyn.berto.se>
References: <1544732509-6911-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1544732509-6911-1-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thanks for your work.

On 2018-12-13 20:21:49 +0000, Fabrizio Castro wrote:
> Add the compatible string for RZ/G2E (a.k.a. R8A774C0) to the
> list of supported SoCs.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> index 2824489..11cf38d 100644
> --- a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> +++ b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> @@ -2,12 +2,13 @@ Renesas R-Car MIPI CSI-2
>  ------------------------
>  
>  The R-Car CSI-2 receiver device provides MIPI CSI-2 capabilities for the
> -Renesas R-Car family of devices. It is used in conjunction with the
> +Renesas R-Car and RZ/G2 family of devices. It is used in conjunction with the
>  R-Car VIN module, which provides the video capture capabilities.
>  
>  Mandatory properties
>  --------------------
>   - compatible: Must be one or more of the following
> +   - "renesas,r8a774c0-csi2" for the R8A774C0 device.
>     - "renesas,r8a7795-csi2" for the R8A7795 device.
>     - "renesas,r8a7796-csi2" for the R8A7796 device.
>     - "renesas,r8a77965-csi2" for the R8A77965 device.
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
