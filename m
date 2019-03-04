Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A54EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 09:56:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D014206DD
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 09:56:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="kHIClU90"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbfCDJ4X (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 04:56:23 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38812 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfCDJ4X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 04:56:23 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3D31425B7C0;
        Mon,  4 Mar 2019 20:56:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551693381; bh=dKWKWlEvXu/0B3s37SowayVWCI+3pDBMIJYvN33TtR0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kHIClU90nFzqt72EviG2UkQrRcBTXRozn/s/O7yubKvOShJaNjPURL37dubz7aQ7r
         xQ3nuZ5tqG3Yq1MG9/jwH+BFRod9zfp5EhL69zeO7bHGMVK0FtkI7Z+jemZawKGe5b
         2R6Kx4GMqDs/uIj0kbyC/xygZjLQ3L3WYVBZuKCQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7EF7794030D; Mon,  4 Mar 2019 10:56:19 +0100 (CET)
Date:   Mon, 4 Mar 2019 10:56:19 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r8a774c0-cat874: add RTC support
Message-ID: <20190304095619.nqqznj5pqwwa3mn3@verge.net.au>
References: <1550742048-28068-1-git-send-email-biju.das@bp.renesas.com>
 <1550742048-28068-6-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVs_WRSgxGdsWcnok5mH7n4Je-FfT_Z+repbEVHoYnRug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVs_WRSgxGdsWcnok5mH7n4Je-FfT_Z+repbEVHoYnRug@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 01, 2019 at 11:29:21AM +0100, Geert Uytterhoeven wrote:
> On Thu, Feb 21, 2019 at 10:46 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > This patch adds Epson RX-8571 real time clock support.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.2.
