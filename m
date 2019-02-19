Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD906C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 08:59:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3BCA21902
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 08:59:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="m+X+e/cG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbfBSI7C (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 03:59:02 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:13460 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbfBSI7C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 03:59:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1550566741;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=lZi3/S3zzL39Kyou+niVy4FGXCNnJ9Oqjj87ujSzpUU=;
        b=m+X+e/cGlr/hvMCv3ZWgz0MJcbOoNFuPRaJrDTGk0C62RcaITQBvUQEaGJnGfByT3N
        iD1JIuz0gQp42b6QFb7+2j/Wd4cedvPPVYGB+Ay2kkeSKJfs1mXTFwoC8fQaea9PFIM9
        wSXUX0jdZsxRDWNvsM/5Jkkc2B0fNq54LZ1AZ0gsh9hsPIXN3NG2UFdikuoFZae1zQzj
        yhASvCVgMOL6ASeYQuafUXIOEAih5Nf71LzRZFA6KJpc1QROeJRhqHdw03YftCrq1+1G
        rmM1LHX3nHg2mqRahZcnUMsShI3jTndbPp76yUHULlZQJScC1NqFImspO8HKz6036+7g
        vAJw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp01-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.9 AUTH)
        with ESMTPSA id V028b8v1J8x1TW3
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 19 Feb 2019 09:59:01 +0100 (CET)
Date:   Tue, 19 Feb 2019 09:59:00 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Message-ID: <604917520.568924.1550566741047@webmail.strato.com>
In-Reply-To: <20190218135927.30068-4-geert+renesas@glider.be>
References: <20190218135927.30068-1-geert+renesas@glider.be>
 <20190218135927.30068-4-geert+renesas@glider.be>
Subject: Re: [PATCH 3/3] pinctrl: sh-pfc: r8a77990: Rename IOCTRLx registers
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
> R-Car E3, to reflect better their actual purposes, and matching other
> SoCs.
> 
> Update to code to match this.

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
