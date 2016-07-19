Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:40126 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751979AbcGSXBu (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 19 Jul 2016 19:01:50 -0400
Date: Tue, 19 Jul 2016 16:01:49 -0700 (PDT)
Message-Id: <20160719.160149.720394612925020104.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix DMA channel misreporting for the Renesas
 Ethernet drivers
From: David Miller <davem@davemloft.net>
In-Reply-To: <8592210.gMERdmUlCp@wasted.cogentembedded.com>
References: <8592210.gMERdmUlCp@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sun, 17 Jul 2016 16:06:24 +0300

>    Here's a set of 2 patches against DaveM's 'net.git' repo fixing
> up the DMA channel reporting by 'ifconfig'...

Seires applied to net-next.
