Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53044C43612
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 08:44:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 211772133F
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 08:44:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="LrihHbnp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbeLRIoK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 03:44:10 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:16091 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbeLRIoK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 03:44:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1545122647;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=jtm+tEqSskImUcAoezRxF7sXvjQpC+PLmEiGDpUSkP0=;
        b=LrihHbnpQJsww7nLT9KQ9tAJ9l2iTuMfSfJzjzaly6Evms3p1Vf7kzvokvYAhh5xxk
        UciIwr6cJafH+caK/oStEwbcDlEzIHLNhOS+81eFkunEEDznnauZIP+HNYd7GIYZ6JW5
        Iw66/O6kpYVV4xOJHTyi+hgkU8Jw1zh8curWGwLBmM7kwkl/IfU9d/idIlbIdnXERcGf
        odzHrg2xK6bH7PMW0yt7S9vCTogVS6m41lTyjFK/cZ2ucAzKtDQNbRAsuzyUVMjLcjBT
        7tzBIkgRdZ7+ESNCiSvTjU4tZIqGir3ZoIKJSqoww1hc4ZEnrAcckcwimuxpSQdTCHW7
        AtMQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.8 AUTH)
        with ESMTPSA id 60186auBI8hlEM5
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 18 Dec 2018 09:43:47 +0100 (CET)
Date:   Tue, 18 Dec 2018 09:43:47 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Message-ID: <1923069837.495488.1545122627493@webmail.strato.com>
In-Reply-To: <20181217131052.18790-1-horms+renesas@verge.net.au>
References: <20181217131052.18790-1-horms+renesas@verge.net.au>
Subject: Re: [PATCH/RFC] arm64: dts: renesas: sort subnodes of root node in
 board files
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


> On December 17, 2018 at 2:10 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> 
> 
> Sort subnodes of root node in board files alphabetically by node
> names. This aims to provide a simple rule for consistent
> node placement to reduce maintenance burden.
> 
> This should not have any run-time effect.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
