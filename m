Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B57EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 09:54:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAA2B206DD
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 09:54:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="TzDJ9+Ms"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbfCDJyw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 04:54:52 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38788 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfCDJyw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 04:54:52 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E780325B7C0;
        Mon,  4 Mar 2019 20:54:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551693290; bh=Iil3U9crypxnwiSTSLwqys63KiVPNlMFxvlTtW/ztRU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TzDJ9+MsXhqW9sxdLiFZ8K7opM7+WghGrT0PZ1LxuND8sflQRa5nG5IypfkkLJxQc
         ca1nVzHqg6Q9doLF0+th4IqzwYq6G/o9HamR7WEmQp4ifYTmjTYYIMxEa5l1x2Kneh
         dzz5h9HecikKcKfprIb93iVK/yS2bXSCrGLyI81A=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 2802394030D; Mon,  4 Mar 2019 10:54:48 +0100 (CET)
Date:   Mon, 4 Mar 2019 10:54:48 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH] arm64: renesas_defconfig: Enable RX-8581 config option
Message-ID: <20190304095447.5hhwzlfwmsv7ihtz@verge.net.au>
References: <1551444976-48763-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdWX4107EcCA0UMW=Cbj5DTFkame_FR9UVwMEd+5GzouAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWX4107EcCA0UMW=Cbj5DTFkame_FR9UVwMEd+5GzouAg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 01, 2019 at 02:14:34PM +0100, Geert Uytterhoeven wrote:
> On Fri, Mar 1, 2019 at 2:02 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Enable support for RX-8571/RX-8581 RTC, which is used by
> > RZ/G2E (r8a774c0) based Silicon Linux CAT874 board.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks,

I have applied this to the topic/renesas-defconfig branch.
This branch is included in the devel branch of the renesas tree.
But it is not included in the next branch nor targeted at inclusion
in mainline.
