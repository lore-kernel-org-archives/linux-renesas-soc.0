Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF50BC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 08:57:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 24D3F21902
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 08:57:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="AmedZmia"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbfBSI5d (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 03:57:33 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.217]:22464 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbfBSI5d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 03:57:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1550566651;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Ndo8qPlDA0Hd46QZSdngRMfM+t9kNMRVot4n9w8pbzg=;
        b=AmedZmiafMueXlrg3fTubf0Sl34bUDrNxcPa0e0xpqW9V01oJDrsRi5/uI+dLSh8l4
        HI4ori30V+/0KQrkSWlzyFoS2aJN7taYRukVXdZsW0cHIQATF81ZsO2Q4yfJ/AcIZz3P
        I6nuF7bnT/jlSvPF9vyEmZoq3gLUVqqVA6KARCkG5Lz2YaLwKyM6lJNm/EfROYk401wH
        24TV349gtXUvuUriBdaHlz/3IX+xyiBXEl4nAi1kP8iaWmTjhykymXfuwBIqHnNo/23O
        K59Ars/CxPQD9zsQ8kiOtaZoosRSEm95pqdIC4VVwU79BILgY7z27C+yCox/BnWZM6kK
        BTBg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp01-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.9 AUTH)
        with ESMTPSA id V028b8v1J8vVTVV
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 19 Feb 2019 09:57:31 +0100 (CET)
Date:   Tue, 19 Feb 2019 09:57:31 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Message-ID: <296667801.568794.1550566651459@webmail.strato.com>
In-Reply-To: <20190218135927.30068-2-geert+renesas@glider.be>
References: <20190218135927.30068-1-geert+renesas@glider.be>
 <20190218135927.30068-2-geert+renesas@glider.be>
Subject: Re: [PATCH 1/3] pinctrl: sh-pfc: r8a77970: Rename IOCTRLx registers
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev50
X-Originating-IP: 188.192.207.28
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On February 18, 2019 at 2:59 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> 
> The R-Car Gen3 HardWare Manual Errata for Rev. 1.00 (Jul 2, 2018)
> renamed the various miscellaneous I/O control registers (IOCTRLx) on
> R-Car V3M, to reflect better their actual purposes, and matching other
> SoCs.
> 
> Update to code to match this.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
