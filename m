Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E633C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 09:25:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7DEB217D9
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 09:25:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="Xjl6Uw68"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbeLRJZl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 04:25:41 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:36536 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbeLRJZl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 04:25:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1545125138;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=32Tco8vEHIAzyWT1H3UOmr69r3xALiX3OFsoOnXbF3g=;
        b=Xjl6Uw68/rdFYy+sIrijVjJ0dJ2yZeAChxG1DgjQZVLzjR09rIHGKqAjuqL+subjlI
        XRnjBsU8ERNGLCWabl/p8xLABFnzgIcWdbVkdpPs8GMOCt+OXmfy+pVnvOCHn1Bh4h38
        KX7MEAA8vXmFKRVw8Ofacrwhv/DwdFKM7UvnTvFprH4rNKv5w8zHZo4aTGxOnvUSKFou
        8u5daVB2ApYf/DUJEetguR2I/dQvoKjwoMVWJ1KvR9h80r1lmHPbdKQkHSzkkCtWq/N6
        iTrXX3cPtzjiX5lCsukkJpcyq7jNy/izCcivJCGrg0EneXYesS68rTdNm++h8V2jLHAX
        49lg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.8 AUTH)
        with ESMTPSA id 60186auBI9PAEZZ
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 18 Dec 2018 10:25:10 +0100 (CET)
Date:   Tue, 18 Dec 2018 10:25:09 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Message-ID: <1705781973.498941.1545125110032@webmail.strato.com>
In-Reply-To: <20181214155844.25662-1-horms+renesas@verge.net.au>
References: <20181214155844.25662-1-horms+renesas@verge.net.au>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a77990: ebisu: Fix
 EthernetAVB phy mode to rgmii
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev47
X-Originating-IP: 85.212.91.246
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On December 14, 2018 at 4:58 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> 
> 
> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> 
> According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
> August 24, 2018, the TX clock internal delay mode doesn't support
> on R-Car E3. This patch fixes EthernetAVB phy mode to rgmii.
> 
> v2 [Simon Horman]
> * Simply drop phy-mode property from r8a77990-ebisu.dts
>   as the default property for this for r8a77990, as set in
>   r8a77990.dtsi, is "rgmii".
> 
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
>  Based on renesas-devel-20181213-v4.20-rc6
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> index 62bdddcbbae7..b7082c5bab60 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -248,7 +248,6 @@
>  	pinctrl-names = "default";
>  	renesas,no-ether-link;
>  	phy-handle = <&phy0>;
> -	phy-mode = "rgmii-txid";
>  	status = "okay";
>  
>  	phy0: ethernet-phy@0 {
> -- 
> 2.11.0
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
