Return-Path: <SRS0=Nz1U=SI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6783C282DC
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  6 Apr 2019 06:07:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A603D21855
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  6 Apr 2019 06:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554530830;
	bh=OEiBF793n6NxuVG/jssi0K8NQucEQAxTimM9rywpaWg=;
	h=Date:From:Subject:References:In-Reply-To:Cc:Cc:To:List-ID:From;
	b=1GmLp3DW861b0k3a14OlsOJg0AwHq04DWg1cpn+8mDXSLfvvktvpCYXNZz3LKy77g
	 N9wwfGt+/pVyVVFR8YWkLKDl9myjnPhXLJeblYZzyUI2j9fFTyvIO+3GkN3Ymxj8Fd
	 FyBEaM4kySP6TbJvPZojk4xsQ/jUF3Zdo3HWj0a4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbfDFGHK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 6 Apr 2019 02:07:10 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45165 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbfDFGHI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 6 Apr 2019 02:07:08 -0400
Received: by mail-pf1-f194.google.com with SMTP id e24so4437101pfi.12;
        Fri, 05 Apr 2019 23:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=8JZvFWLCGJIM/d6e0nrwlrSSNz4Eq/z+qsNAoxpUY50=;
        b=TbKFYdKnf1HhHRj/nd9/6FDZDyyf1tI5vRB8oOaW9o4HXCvUrHFYN7h2yAE83JRMno
         4jHrLhGEfNKliWlqIRwbQBpiTY484114SEft8W9D3LPzVUtAUJjO/DQt5rxR/3Ejn47X
         TW101TKb2/njHSXcVxEDQ2mU6HBouKntpClxNpQ7C7MI4R2LgS/zp9oTogAhqi6bURM8
         4JYiHZo3eXPp5SMuNoLSkS+hBXbz1tz9oPUzvFW0x9xjTYpOuhipdmvG1x7hOB4ZfPad
         05DPgri2z/rsdRuSVZSO33JA/e3qzQsEhW5+bg4n7ek6lmZEoglAkTGpgk6WgWxW6leE
         Pnzg==
X-Gm-Message-State: APjAAAXdDsfp8DvFVUWK9ZadsBiAT5/fWAhewIPqAm+NnINvp1uIymEv
        RBp/z1XsCc61QzLb1cQP7A==
X-Google-Smtp-Source: APXvYqzS3MN3xXIcW+Ez1iuR98OFPxrcQ4yWxKTzmvug+dewvnLbpxULEaKTtKN0AyKcX3v+bx65CA==
X-Received: by 2002:a63:7885:: with SMTP id t127mr15719733pgc.338.1554530827148;
        Fri, 05 Apr 2019 23:07:07 -0700 (PDT)
Received: from localhost ([210.160.217.71])
        by smtp.gmail.com with ESMTPSA id a6sm32954922pfn.181.2019.04.05.23.07.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Apr 2019 23:07:06 -0700 (PDT)
Message-ID: <5ca8420a.1c69fb81.dd478.6e96@mx.google.com>
Date:   Sat, 06 Apr 2019 01:07:04 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 01/13] dt-bindings: phy: rcar-gen2: Add r8a77470 support
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com> <1554287324-22312-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554287324-22312-2-git-send-email-biju.das@bp.renesas.com>
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

On Wed,  3 Apr 2019 11:28:32 +0100, Biju Das wrote:
> Add USB PHY support for r8a77470 SoC. Renesas RZ/G1C (R8A77470)
> USB PHY is similar to the R-Car Gen2 family, but has the below
> feature compared to other RZ/G1 and R-Car Gen2/3 SoCs
> 
> It has a shared pll reset for usbphy0/usbphy1 and this register
> reside in usbphy0 block.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> V2-->V3
>   * No Change
> V1-->V2
>   * Incorporated Rob's review comment
>     https://patchwork.kernel.org/patch/10655853/
> ---
>  .../devicetree/bindings/phy/rcar-gen2-phy.txt      | 57 ++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

