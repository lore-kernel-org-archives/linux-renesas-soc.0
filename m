Return-Path: <SRS0=lsYt=RZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0C3C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Mar 2019 10:17:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A286A218FC
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Mar 2019 10:17:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="eEgUeIQ6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727908AbfCVKR4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 22 Mar 2019 06:17:56 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:55687 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbfCVKR4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Mar 2019 06:17:56 -0400
Received: from penelope.horms.nl (unknown [195.39.71.253])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C906E25B79A;
        Fri, 22 Mar 2019 21:17:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553249874; bh=BEXkv4FI6hZUjmKjeJzM4dlp+7CZ1OrKgSj4j0ryYaA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eEgUeIQ6YrEFR+eytXcXYSlYtnvJWAKHcTCxlFylWIr/f5q8GAmeQh399BObcNzUO
         QD01uSaQBHgAjNlkwiWg+SpRRx4tFfIHEznu8/qUtJaRAurlx4IywacsvNRIFsTS0L
         fgLNKaf7n3e/LiritMAZoLCr+BB7dfbwahPJRFZg=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 09AE3E21330; Fri, 22 Mar 2019 11:17:52 +0100 (CET)
Date:   Fri, 22 Mar 2019 11:17:52 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: Sort node label
Message-ID: <20190322101751.raqgpkrcjzmuj7tr@verge.net.au>
References: <20190322092502.16604-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190322092502.16604-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 22, 2019 at 10:25:02AM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch sorts the node label to improve maintainability.
> The sort has been done alphabetically with the node label name as the
> key.
> 
> This patch does not include functional changes.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.2.
