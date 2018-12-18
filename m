Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406C9C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 08:22:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17B5A214C6
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 08:22:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="fwJLNgVP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbeLRIWi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 03:22:38 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.217]:21710 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbeLRIWi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 03:22:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1545121353;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=R+EM2TIS78iQuvs4hkM9Jfi4hUtD4WvZdDfYHOu062Y=;
        b=fwJLNgVPMuULKddcy1M5ZOpDvaB2UcD3+5hda6doEfHzzJVAjxQYF2JX0qn5c8klnA
        /8Rlgi/raHsidkw0RF9H9rAqLHna+W3cWj/tDNmqaqNhG2vsSeephcOJUJMC8s7G1+em
        p8naKtGxDj2ghlFphBAkqqK//Br9R88AimLuG1wlFXMZE+TVoUHxQb07f39RzCaOkgXF
        8n6MDyD1gmUg21vaXhwKYsgrohXghfUIA6kUzo9TAB6J7IBTfg4yTEiX5HKVNPnzJDUB
        VLS3eQCKlT2h8Ziv2FKzQ2msEXBai0eMmeZljW46WjpeHqj/uV2ds6FRgsrwnTWVTBhM
        khow==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.8 AUTH)
        with ESMTPSA id 60186auBI8MXEFn
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 18 Dec 2018 09:22:33 +0100 (CET)
Date:   Tue, 18 Dec 2018 09:22:33 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Message-ID: <1685843510.493842.1545121353460@webmail.strato.com>
In-Reply-To: <20181216113217.11379-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20181216113217.11379-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Set better
 backlight levels
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


> On December 16, 2018 at 12:32 PM Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:
> 
> 
> The backlight levels provided in the Draak DT produce a perceived
> brightness very biased towards high brightness. Use better brightness
> levels based on the CIE 1931 formula.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
