Return-Path: <SRS0=oRiM=O4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EF3C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 09:56:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7139218A6
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 09:56:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="T746Pjo8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbeLSJ4V (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Dec 2018 04:56:21 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.25]:33737 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727963AbeLSJ4V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Dec 2018 04:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1545213376;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=nz93Z8IyBLSAUg3p9KWVWGrSN7Z3OLzcKpF/IFzV//4=;
        b=T746Pjo8mmM1eLWOSaU/YPZ7h9RDfWUN7BSMHOU429b7dTmxygzL3GtuWuKtsVLB43
        bVeK94bMN2+MFzacG3lPosNniDt+17EUmIiyDqgZX5cOFzCr8obJjmAuBXo8NfS1wFA7
        6b9QXwU/mAkf/LKPaqCqZzjkeUg8LIZb8LusDZIEsyV8z2RafOYQX+baWDR8CMxlbOfF
        gwa+5sSjkKMG1K3OdDQTHvE3GzmnUanpa7wlZU/EU61OOkiAAJ0CRaJj9T1rtxaOc0Ju
        GmO70upVJqJPvqNf1EMr9XDD9tM7O83xSkz5wTV/dy97tbEeduZKjSsl8TAd1CSZoi2L
        Hf4g==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.8 AUTH)
        with ESMTPSA id j0554cuBJ9uG1Qm
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 19 Dec 2018 10:56:16 +0100 (CET)
Date:   Wed, 19 Dec 2018 10:56:15 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Message-ID: <1923982085.555605.1545213375957@webmail.strato.com>
In-Reply-To: <20181218170555.121673-2-chris.brandt@renesas.com>
References: <20181218170555.121673-1-chris.brandt@renesas.com>
 <20181218170555.121673-2-chris.brandt@renesas.com>
Subject: Re: [PATCH v4 1/2] ARM: dts: r7s9210: Initial SoC device tree
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev47
X-Originating-IP: 85.212.212.91
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On December 18, 2018 at 6:05 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> 
> 
> Basic support for the RZ/A2 (R7S9210) SoC.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
