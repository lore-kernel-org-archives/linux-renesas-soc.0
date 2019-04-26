Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA8BC43219
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:48:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 670F62089E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:48:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbfDZJon (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 05:44:43 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45044 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfDZJom (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 05:44:42 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E447E25AEA8;
        Fri, 26 Apr 2019 19:44:39 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 04EA09403ED; Fri, 26 Apr 2019 11:44:37 +0200 (CEST)
Date:   Fri, 26 Apr 2019 11:44:37 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        linux-renesas-soc@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/2] i2c: core: apply 'is_suspended' check for SMBus,
 too
Message-ID: <20190426094437.6f73fbolq2snfmka@verge.net.au>
References: <20190425141948.29255-1-wsa+renesas@sang-engineering.com>
 <20190425141948.29255-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190425141948.29255-3-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 25, 2019 at 04:19:48PM +0200, Wolfram Sang wrote:
> We checked I2C calls, but not SMBus. Refactor the helper to an inline
> function and use it for both, I2C and SMBus.
> 
> Fixes: 9ac6cb5fbb17 ("i2c: add suspended flag and accessors for i2c adapters")
> Reported-by: Peter Rosin <peda@axentia.se>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

