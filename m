Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3D1C43219
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:48:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54FF02089E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:48:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbfDZJoc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 05:44:32 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45024 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727225AbfDZJob (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 05:44:31 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5409F25AEA8;
        Fri, 26 Apr 2019 19:44:29 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 224D69403ED; Fri, 26 Apr 2019 11:44:27 +0200 (CEST)
Date:   Fri, 26 Apr 2019 11:44:27 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        linux-renesas-soc@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/2] i2c: core: ratelimit 'transfer when suspended'
 errors
Message-ID: <20190426094426.uvjkaelbl7fvvxqf@verge.net.au>
References: <20190425141948.29255-1-wsa+renesas@sang-engineering.com>
 <20190425141948.29255-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190425141948.29255-2-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 25, 2019 at 04:19:47PM +0200, Wolfram Sang wrote:
> There are two problems with WARN_ON() here. One: It is not ratelimited.
> Two: We don't see which adapter was used when trying to transfer
> something when already suspended. Implement a custom ratelimit once per
> adapter and use dev_WARN there. This fixes both issues. Drawback is that
> we don't see if multiple drivers are trying to transfer with the same
> adapter while suspended. They need to be discovered one after the other
> now. This is better than a high CPU load because a really broken driver
> might try to resend endlessly.
> 
> Fixes: 9ac6cb5fbb17 ("i2c: add suspended flag and accessors for i2c adapters")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
