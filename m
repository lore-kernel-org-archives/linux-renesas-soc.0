Return-Path: <SRS0=W0u2=XA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E58C3A5A5
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  5 Sep 2019 09:08:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B77B02145D
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  5 Sep 2019 09:08:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732979AbfIEJIj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 5 Sep 2019 05:08:39 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:60280 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732160AbfIEJIj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 05:08:39 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 194BF25B753;
        Thu,  5 Sep 2019 19:08:37 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 092FE940AC6; Thu,  5 Sep 2019 11:08:34 +0200 (CEST)
Date:   Thu, 5 Sep 2019 11:08:34 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     arm-soc <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Fixes for v5.3
Message-ID: <20190905090834.7pnvnaqovqnwiuik@verge.net.au>
References: <cover.1565962268.git.horms+renesas@verge.net.au>
 <CAK8P3a0rQgEj9gQh-jyPOtoj+QVT2eeXz-vF0v5aKfnzWXP35g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0rQgEj9gQh-jyPOtoj+QVT2eeXz-vF0v5aKfnzWXP35g@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 04, 2019 at 02:40:36PM +0200, Arnd Bergmann wrote:
> On Fri, Aug 16, 2019 at 3:33 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> >
> > are available in the git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes-for-v5.3
> >
> > for you to fetch changes up to 45f5d5a9e34d3fe4140a9a3b5f7ebe86c252440a:
> >
> >   arm64: dts: renesas: r8a77995: draak: Fix backlight regulator name (2019-08-09 11:58:17 -0700)
> >
> > ----------------------------------------------------------------
> > Renesas ARM Based SoC Fixes for v5.3
> >
> > * R-Car D3 (r8a77995) based Draak Board
> >   - Correct backlight regulator name in device tree
> 
> I just found this pull request in the arm@kernel.org inbox, sorry for missing
> it earlier. The 5.4 pull requests that Geert sent in the meantime are all
> merged as they went to the new soc@kernel.org address.
> 
> Pulled this now into arm/fixes.

Thanks, and sorry for using the old email address.

I do have one more fix which I plan to post later today.
