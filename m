Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5408C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 10:23:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 722DD21019
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 10:23:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="e5ILxqA0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbfAWKXI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 05:23:08 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:51225 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbfAWKXI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 05:23:08 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8F5F625BE34;
        Wed, 23 Jan 2019 21:23:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548238985; bh=SvTJMYKtDltE9vKtukIipkVQZkIael56ZnnBjX84+Yo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e5ILxqA03NfMtfg/bRpMuppmKiq63t54dnX5V0/qoukXEkBk26FENarydahDSo9kf
         slg/XWfIFUU6uGt6vj7otF7te/nSy6FHdbmB2wga4hGpdEu8R0cAY7fwwGtdMkorrf
         0tqPM654urCHr3vTSHNHCb7PNfGwMPQYCEyzLzkQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C313F940471; Wed, 23 Jan 2019 11:23:03 +0100 (CET)
Date:   Wed, 23 Jan 2019 11:23:03 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: algo-bit: include main i2c header
Message-ID: <20190123102303.ln2veejdidogxd4y@verge.net.au>
References: <20190119121655.5576-1-wsa+renesas@sang-engineering.com>
 <20190119121655.5576-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190119121655.5576-2-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Jan 19, 2019 at 01:16:53PM +0100, Wolfram Sang wrote:
> We are using symbols from it, so we should include it directly. Found
> after sorting includes in a driver.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

