Return-Path: <SRS0=Nz1U=SI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64CEC282DA
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  6 Apr 2019 06:07:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86CA821871
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  6 Apr 2019 06:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554530833;
	bh=ozfq7M3DXBU7rueBwGtac6eOtecXHsrrOKWF8q0e+Ng=;
	h=Date:From:Subject:References:In-Reply-To:Cc:Cc:To:List-ID:From;
	b=0wa3QsjvNxHJaCbc3aAoyzM+lIBUlTzYf9DMLAgSaHZZdHrfIsIjDTa3H7P7jNgDp
	 1bu4jfs/kvl3an9QcYfD/FUKgSsTlivWHo1mkXmRVmu6XQPS1xBLQHOfUb3V3P2Tic
	 T9Z8Q7PKh0SZN2UBAByOcPzga/1+Erx6UTNjiArk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfDFGHM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 6 Apr 2019 02:07:12 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34555 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbfDFGHL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 6 Apr 2019 02:07:11 -0400
Received: by mail-pf1-f193.google.com with SMTP id b3so4464915pfd.1;
        Fri, 05 Apr 2019 23:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=7vYmvw1OREtQbxMjgHRqCnNWxeeG/NNUTSgBQdL0qks=;
        b=FlmT0w06mDVDZme5zbiEPK/LeuOH/VwEKN01VMoVnktU2k+sMf6A+if/aRjjrUS8Ci
         HFHQl4cvcEotCiWdzHdq8PNgyTfrEP0o4jYzXWbYVQYwujDUVj8vwPxvsOmX4qdg+mwQ
         l117AqJFpgP8relqU1wnQ/anGsPT4pXUsQn17Ti62EpmeL+SGdYt79RqDeWhnLS35G4D
         VWTPEowZSSYGgsCUXBcIIaiNhfoZvAGSpkuDpoxjEKTpAQTE5+HoSSnBJ6kf8iZaGMOR
         bZV7FQXFEh61KSAp/V1EzTp0Fc+Vux2/C1cvDYI9VLZX737TH3acQ6SQkG3iIfH6lkFu
         hRfw==
X-Gm-Message-State: APjAAAWdqLphwC4WMUXu4/NYqeorQiXJBePn+aohAF9gprPRfdb595MN
        6v/VUFNe9/so0Q5MoL6fsKvYglOsWA==
X-Google-Smtp-Source: APXvYqyAvKkEZQb0GcokaKHw3VWD5A6RPM6kWa+JR7GwLNq+jG2JtBcdGWAPi+2ASOPymgwGTneCAQ==
X-Received: by 2002:a63:f956:: with SMTP id q22mr5239018pgk.210.1554530830503;
        Fri, 05 Apr 2019 23:07:10 -0700 (PDT)
Received: from localhost ([210.160.217.71])
        by smtp.gmail.com with ESMTPSA id k6sm19507490pfj.173.2019.04.05.23.07.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Apr 2019 23:07:09 -0700 (PDT)
Message-ID: <5ca8420d.1c69fb81.ba182.33eb@mx.google.com>
Date:   Sat, 06 Apr 2019 01:07:07 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 03/13] dt-bindings: rcar-gen3-phy-usb2: Add r8a77470 support
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com> <1554287324-22312-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554287324-22312-4-git-send-email-biju.das@bp.renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
To:     Biju Das <biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed,  3 Apr 2019 11:28:34 +0100, Biju Das wrote:
> Document RZ/G1C (R8A77470) SoC bindings.
> 
> For RZ/G1C, this driver is used to enable interrupt generation and
> initializing timing registers which is part of phy_init code.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> V2-->V3
>   * New patch
>     https://patchwork.kernel.org/patch/10879899/
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

