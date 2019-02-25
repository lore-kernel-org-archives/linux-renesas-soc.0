Return-Path: <SRS0=0nld=RA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633BAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 08:30:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C8BF20842
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 08:30:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y/lsgOvU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbfBYIa6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Feb 2019 03:30:58 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34834 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbfBYIa6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Feb 2019 03:30:58 -0500
Received: from pendragon.ideasonboard.com (85-76-109-165-nat.elisa-mobile.fi [85.76.109.165])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24A6C67;
        Mon, 25 Feb 2019 09:30:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551083456;
        bh=qvjNckEjezeYQS6Ldo8U8GH536RagRl0KuFjMJNlVvs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y/lsgOvUIobfwCLPFpjJLdSG/Du5kX031RiKzarglibSuL1H5mYOEveqYbmJM901Y
         uXZ6bYbcpOKo8my+MtYFkgHjaUruE8qVLbqUbiTcqS7WIrUABoYasMRK2h7y9Hoech
         ZjnxaL4SYr0+ylaKlPRBnTk5R1yTKg/GZ+zb1Pe4=
Date:   Mon, 25 Feb 2019 10:30:50 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        DUNG NGUYEN <dung.nguyen.aj@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v2 0/6] R-Car DU DPAD support for D3 and E3
Message-ID: <20190225083050.GA4387@pendragon.ideasonboard.com>
References: <20190122225405.7815-1-laurent.pinchart+renesas@ideasonboard.com>
 <87tvgs1fx6.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87tvgs1fx6.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Mon, Feb 25, 2019 at 04:44:55PM +0900, Kuninori Morimoto wrote:
> 
> Hi Laurent
> 
> > For your convenience the patches are available from
> > 
> >         git://linuxtv.org/pinchartl/media.git drm/du/d3e3
> 
> It seems we can't find this branch/tag on your branch
> Is it removed ? or not yet pushed ?
> 
> 	https://git.linuxtv.org/pinchartl/media.git/refs/heads

The branch has been merged to drm-next (for the DU driver part) and to
Simon's next branch (for the DT part), so I've removed it from my tree.
You can find a merge of those two branches in my repository in the
drm/du/base branch.

-- 
Regards,

Laurent Pinchart
