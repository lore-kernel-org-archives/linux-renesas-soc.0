Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536D1C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 09:58:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 123E92082F
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 09:58:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="r4sIzL3u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfCDJ6g (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 04:58:36 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38836 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbfCDJ6g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 04:58:36 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3842225B7C0;
        Mon,  4 Mar 2019 20:58:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551693514; bh=ngZlhBTO3V+VwPykcEKn9HjgSeR5ZoNMPRtSgy7DOxg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r4sIzL3uZSuth0cN3fLyAB0JJKDBa2mtcokYi0vnekR49Nl2H28+vZXVuzv38F0AO
         YxAAE3NaFFbFM5gdDkklLTyrxZ2W14DTJg0uIkRmGhfga5Mij/ag33MMvBbXXU3NYl
         oM+PR41PkJjheaPgcRPU71ZnPQIJdyVmn3J3gI9w=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6C24494030D; Mon,  4 Mar 2019 10:58:32 +0100 (CET)
Date:   Mon, 4 Mar 2019 10:58:32 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, ebiharaml@si-linux.co.jp
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0-cat874: Add LEDs support
Message-ID: <20190304095832.mvnlmtxlrwdgebld@verge.net.au>
References: <1551438212-22013-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdU60gp+pnCuCv07y30d3Y8ggem8UK7PhPdr-DqQGzwK1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU60gp+pnCuCv07y30d3Y8ggem8UK7PhPdr-DqQGzwK1Q@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 01, 2019 at 02:32:41PM +0100, Geert Uytterhoeven wrote:
> On Fri, Mar 1, 2019 at 12:03 PM Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > This patch adds LEDs support to the CAT874 board specific
> > device tree.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.2.
