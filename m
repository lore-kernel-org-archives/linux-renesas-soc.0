Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC2DC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 10:48:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0406620874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 10:48:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="iekA5O5J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbeLQKsH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 05:48:07 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38444 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbeLQKsH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 05:48:07 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9735D25B781;
        Mon, 17 Dec 2018 21:48:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545043684; bh=lTKmv75eMRpI752KS20rxqYUg9CCUnTDB23a0et3PU0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iekA5O5J28h/RGRdQx3bPN6twIwHo5ut4bFR2nmX6jbsbriNPHOCgMasoooi65gdU
         ESX65GTExcXZoCATnDE8BZdYP58QOBi83k1PEE7Euo+/sYHX4OC2rHiLHlMzcdmdcP
         u83ADqtqBTNh0vWgnDFZYsLiVQA71f6wnehGEjkQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id E0A2B9402FB; Mon, 17 Dec 2018 11:48:02 +0100 (CET)
Date:   Mon, 17 Dec 2018 11:48:02 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 10/17] arm64: dts: renesas: r8a774c0: Add USB2.0 phy and
 host device nodes
Message-ID: <20181217104802.csbtrwz2wkyqqw3d@verge.net.au>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-11-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544780260-27590-11-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 14, 2018 at 09:37:33AM +0000, Fabrizio Castro wrote:
> Add USB2.0 phy and host (EHCI/OHCI) device tree nodes to the RZ/G2E
> SoC dtsi.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
