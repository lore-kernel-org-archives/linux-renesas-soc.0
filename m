Return-Path: <SRS0=F87W=UC=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8421C28CC6
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  3 Jun 2019 11:40:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC7B028155
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  3 Jun 2019 11:40:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbfFCLkw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 3 Jun 2019 07:40:52 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56012 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728476AbfFCLkt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jun 2019 07:40:49 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id DE69C25AECE;
        Mon,  3 Jun 2019 21:40:47 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id DD4C19403CA; Mon,  3 Jun 2019 13:40:45 +0200 (CEST)
Date:   Mon, 3 Jun 2019 13:40:45 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 08/10] arm64: dts: renesas: r8a7799[05]: Point LVDS0
 to its companion LVDS1
Message-ID: <20190603114045.jusjfo3tswro4xbm@verge.net.au>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-9-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528141234.15425-9-laurent.pinchart+renesas@ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 28, 2019 at 05:12:32PM +0300, Laurent Pinchart wrote:
> Add the new renesas,companion property to the LVDS0 node to point to the
> companion LVDS encoder LVDS1.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Hi Laurent,

is this patch ready to be merged?
