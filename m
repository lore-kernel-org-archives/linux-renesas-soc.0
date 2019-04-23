Return-Path: <SRS0=hHdZ=SZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB452C10F14
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 10:28:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 93218214AE
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 10:28:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfDWK2s (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 23 Apr 2019 06:28:48 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45974 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfDWK2s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Apr 2019 06:28:48 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C13AC25AE8B;
        Tue, 23 Apr 2019 20:28:45 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B6B119403E4; Tue, 23 Apr 2019 12:28:43 +0200 (CEST)
Date:   Tue, 23 Apr 2019 12:28:43 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 4/5] ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in
 shmobile_defconfig
Message-ID: <20190423102843.tncosz5cd3jaco6a@verge.net.au>
References: <cover.1555654474.git.horms+renesas@verge.net.au>
 <0cd4f4f10245d1d9616e00245093f46acd198141.1555654474.git.horms+renesas@verge.net.au>
 <CAMuHMdVQZbVCGhc==bvV6N-R4NuBwnwUShvL1S9xaHcSJY5B7w@mail.gmail.com>
 <OSBPR01MB2103BC726501AF1339531D0DB8230@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103BC726501AF1339531D0DB8230@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 23, 2019 at 09:45:18AM +0000, Biju Das wrote:
> Hi Geert,
> 
> Thanks for the feedback.
> 
> Simon,
>  
> How do you want to address this? A new patch for  taking out "CONFIG_GENERIC_PHY=y"
> from shmobile_defconfig  ?? Please let us know.

Hi Biju,

yes, I think that an incremental patch would be best.
