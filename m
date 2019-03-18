Return-Path: <SRS0=zXAj=RV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B55C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 10:56:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 35F8B20854
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 10:56:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="C9oaIzJ1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbfCRK4C (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Mar 2019 06:56:02 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:53996 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726493AbfCRK4C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Mar 2019 06:56:02 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5ADD125B7A1;
        Mon, 18 Mar 2019 21:56:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552906560; bh=e0SconYsBgyFFPPVNrmxcdEFlfC/+3hD0ohZG4c/m2w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C9oaIzJ1Tv8xFJzsqRGVLW9liHZOd5YOZvxlvAumoMHnjgSugF/dC3nW++ReorGDo
         gqdu4L79DkbrC1rPGriN1lDz+j/UYbxw4S6/IQUr3DqmDV8Ya2z6uNqYk/0MQElfDT
         sn7vUJDUwxIq+DM3RI9I2AAO64wcnkvL5uYxv7rI=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 9D9519406ED; Mon, 18 Mar 2019 11:55:58 +0100 (CET)
Date:   Mon, 18 Mar 2019 11:55:58 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Frank Mehnert <frank.mehnert@kernkonzept.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: Reference manual of Renesas SDHI controller
Message-ID: <20190318105557.gud5wkfmcufhp3pw@verge.net.au>
References: <7536072.idt63dpu4t@noys4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7536072.idt63dpu4t@noys4>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 06, 2019 at 05:30:59PM +0100, Frank Mehnert wrote:
> Hi all,
> 
> could anybody provide me a link to a reference manual of the Renesas SDHI
> controller which are used in the RCar3 SoC?

Hi Frank,

my understanding is that this information is only available
from Renesas under NDA. I would suggest contacting your local
Renesas representative.
