Return-Path: <SRS0=F/Q8=RI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F47C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 12:07:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1795B206DD
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 12:07:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="CsZh7Qbj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbfCEMHR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Mar 2019 07:07:17 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.25]:28423 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfCEMHR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Mar 2019 07:07:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1551787635;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=jDmr7nA5BwBIcZ/UuWZLWkYwdNXH2xs9CMKIg6mmFRI=;
        b=CsZh7QbjEwkXuHOs8tVVIuVQ5FM26uTtJunMx3hpvoNPrLr0ZhdDehtfzPsREO037y
        5fLkCpDlUeBRiYSZpfWO/QsU80JgkKLwutnET/ohpMUwoTNwouj1JC0dp+h5ddfS1lq3
        ugBwDMQvxuG6aUIub4lEmQIzvoZa00N3HnNA47SJFd3j1cmo9Qo3viw4DwTYn2cKTled
        WTXPiKU8AUYJCe9DG+rXQZit83fY/Yb754KjMGEqueLMZ/nwUqeSTCBci2RrWeptOU4U
        HrFCOdW3mqhJNqvcEjYqV+JLJi+l+kbSy6xylMicoIcm13cuUSkPUv2DPpuJOQxtmBP8
        wbqw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp01-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.13 AUTH)
        with ESMTPSA id u08fcfv25C6qPIZ
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 5 Mar 2019 13:06:52 +0100 (CET)
Date:   Tue, 5 Mar 2019 13:06:52 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Message-ID: <1770426335.645190.1551787612347@webmail.strato.com>
In-Reply-To: <20190213103255.1265-1-horms+renesas@verge.net.au>
References: <20190213103255.1265-1-horms+renesas@verge.net.au>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77995: draak: Fix
 EthernetAVB phy mode to rgmii
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev51
X-Originating-IP: 85.212.94.77
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On February 13, 2019 at 11:32 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> 
> 
> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> 
> According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
> August 24, 2018, the TX clock internal Delay mode does'nt support
> on R-Car D3. This patch fixes EthernetAVB phy mode to rgmii.
> 
> This is achieved by simply dropping the phy-mode property from
> r8a77995-draak.dts as the default property for this for r8a77995,
> as set in r8a77995.dtsi, is "rgmii".
> 
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> index db2bed1751b8..bfa260c9f78c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -168,7 +168,6 @@
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

Works for me.

Tested-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
