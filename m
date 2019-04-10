Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560D8C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 09:40:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1BE012083E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 09:40:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728661AbfDJJkB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 05:40:01 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40676 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbfDJJkB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 05:40:01 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6386425BE4C;
        Wed, 10 Apr 2019 19:39:59 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 609F9940356; Wed, 10 Apr 2019 11:39:57 +0200 (CEST)
Date:   Wed, 10 Apr 2019 11:39:57 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, devicetree@vger.kernel.org,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: Re: [PATCH 06/11] ARM: dts: r8a77470: Add Audio support
Message-ID: <20190410093957.6xpdpsxboaic7wlt@verge.net.au>
References: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp>
 <1554799912-24764-7-git-send-email-cv-dong@jinso.co.jp>
 <87o95e7lmp.wl-kuninori.morimoto.gx@renesas.com>
 <73ad4c10-ed8e-7fdc-1c68-837786cfaf6d@jinso.co.jp>
 <87imvm7jup.wl-kuninori.morimoto.gx@renesas.com>
 <d5a96c31-aec4-9752-26fd-e3d878e028a2@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5a96c31-aec4-9752-26fd-e3d878e028a2@jinso.co.jp>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 10, 2019 at 10:33:57AM +0900, Cao Van Dong wrote:
> Dear Morimoto-san,
> 
> On 2019/04/10 10:16, Kuninori Morimoto wrote:
> > Hi Cao-san
> > 
> > > > BTW, this patch-set is including SoC only.
> > > > Do you have plan to post board support patch after this ?
> > > > In other words, did you test these ?
> > > Thanks for your feedback and help!
> > > I will create a separate patch (add
> > > rcar_sound-r8a77470toDocumentation/../sound/renesas,rsnd.txt)
> > > and update this patch in version 2.
> > Again, are these tested code ?
> > If not, please indicate such information at git-log.
> > Otherwise, people will think that these are well tested upsteam code.
> Sorry for missing the question!
> I will add information to the patch in version 2.

In general I would prefer that patches that can be tested,
f.e. using accompanying board dts, are tested before including them
upstream.
