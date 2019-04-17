Return-Path: <SRS0=NjMp=ST=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A48FC282DA
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 15:48:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62E0D20656
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 15:48:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732105AbfDQPsO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 17 Apr 2019 11:48:14 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34440 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729940AbfDQPsO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Apr 2019 11:48:14 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1894F25AEB0;
        Thu, 18 Apr 2019 01:48:12 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id EABB0940B0E; Wed, 17 Apr 2019 17:48:09 +0200 (CEST)
Date:   Wed, 17 Apr 2019 17:48:09 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] arm: dts: Bootargs update for older boards from
 Renesas
Message-ID: <20190417154809.7zz6qite2j45flry@verge.net.au>
References: <155551391518.5261.925425188248761120.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155551391518.5261.925425188248761120.sendpatchset@octo>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 18, 2019 at 12:11:55AM +0900, Magnus Damm wrote:
> arm: dts: Bootargs update for older boards from Renesas
> 
> [PATCH 1/4] arm: dts: kzm9d: Add rw parameter to bootargs
> [PATCH 2/4] arm: dts: bockw: Reorder bootargs
> [PATCH 3/4] arm: dts: marzen: Add rw to bootargs and use ip=dhcp
> [PATCH 4/4] arm: dts: ape6evm: Reorder bootargs
> 
> These patches try to make bootargs more consistent across older boards with
> 32-bit ARM SoCs from Renesas. Simple reordering, adding rw parameter and in
> case of Marzen we go from ip=on to ip=dhcp. I believe using the ip parameter
> consistently across the boards is a good first step.

Thanks Magnus,

applied for v5.2.
