Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F24C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 12:03:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 154FB2086D
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 12:03:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Cyw9Fp+s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfARMD4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 07:03:56 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:57598 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfARMD4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 07:03:56 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9C95625B799;
        Fri, 18 Jan 2019 23:03:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547813033; bh=uMOVdYIzJCLy7w5Blve8sbgY0daaMqfPhtHXJwsDkuk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cyw9Fp+sjxxXfS8ldzqjP5QyI1dBLaHFLdiPMGwbSY9hXxqU3wW0xSiKHsEpxMfTm
         WWfFdLQ9as04paSHPi8mmi+KowpUGP0J0rJNm9MzOL3MZdBEd+MjGEwABndvoIy0tS
         PLzxh7nERMeBMBAwUMXu1DyReIFmqjlIXBZ90h7s=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id AD8F4940356; Fri, 18 Jan 2019 13:03:51 +0100 (CET)
Date:   Fri, 18 Jan 2019 13:03:51 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     geert@linux-m68k.org, linux-renesas-soc@vger.kernel.org,
        linux-serial@vger.kernel.org, magnus.damm@gmail.com
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a7779: add HSCIF0/1 pins
Message-ID: <20190118120351.dg5rcbdjhkv5bqdl@verge.net.au>
References: <1547808495-19509-1-git-send-email-uli+renesas@fpond.eu>
 <1547808495-19509-2-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547808495-19509-2-git-send-email-uli+renesas@fpond.eu>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 18, 2019 at 11:48:14AM +0100, Ulrich Hecht wrote:
> Adds HSCIF0 and HSCIF1 pins, groups and functions for R8A7779.
> 
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7779.c | 106 +++++++++++++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

