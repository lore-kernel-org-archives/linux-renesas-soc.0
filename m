Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F009BC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:17:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B307120578
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:17:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="dkXKeLmu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731785AbeLQPR3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 10:17:29 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:42686 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbeLQPR2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 10:17:28 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7ED4E25B781;
        Tue, 18 Dec 2018 02:17:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545059846; bh=JrtuClayduAC1nRVWYkP6wEQuCIOC5kHQMmUBi/5Lbo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dkXKeLmux1+G5sAR1D+ju/o6Z/max67FpJ/Rum6zjxh47P/XgisA1z+dCd+8Xtou9
         GB1xi33K+5XUqo3dVzQpD+QZH02HjB+MNenFxMsj0cjssxe4uSZJN1MnBY34+q7XHp
         IjURWW/POHVAColDzjFWw7sWymZ6yBGNduEccFGk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A888994048A; Mon, 17 Dec 2018 16:17:24 +0100 (CET)
Date:   Mon, 17 Dec 2018 16:17:24 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 11/15] pinctrl: sh-pfc: Print actual field width for
 variable-width fields
Message-ID: <20181217151721.yfoplcb4hi2gelgr@verge.net.au>
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-12-geert+renesas@glider.be>
 <20181217144618.a6omxq2y4acydp75@verge.net.au>
 <CAMuHMdV6rTRGDjuExaDNjSdBrVg3hb=kZB8RsqibZYKZm6HSsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV6rTRGDjuExaDNjSdBrVg3hb=kZB8RsqibZYKZm6HSsQ@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 03:58:52PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Dec 17, 2018 at 3:46 PM Simon Horman <horms@verge.net.au> wrote:
> > On Thu, Dec 13, 2018 at 07:27:10PM +0100, Geert Uytterhoeven wrote:
> > > The debug code in sh_pfc_write_config_reg() prints the width of the
> > > field being modified.
> > >
> > > However, registers with a variable-width field layout are identified by
> > > pinmux_cfg_reg.field_width being zero, hence zeroes are printed instead
> > > of the actual field widths.
> > >
> > > Fix this by printing the Hamming height of the field mask instead, which
> > > is correct for both fixed-width and variable-width fields.
> >
> > s/height/width ?
> 
> Nah, weight. Will fix.
> https://en.wikipedia.org/wiki/Hamming_weight

I was thinking weight :)

> 
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
