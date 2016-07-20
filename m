Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39690 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753131AbcGTIyV (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 20 Jul 2016 04:54:21 -0400
Date: Wed, 20 Jul 2016 17:54:18 +0900
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ARM: shmobile: r8a7794: tidyup SDHI register size on DTSI
Message-ID: <20160720085417.GA9101@verge.net.au>
References: <1469002759-2860-1-git-send-email-horms+renesas@verge.net.au>
 <20160720085246.GA1673@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160720085246.GA1673@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 20, 2016 at 10:52:46AM +0200, Wolfram Sang wrote:
> 
> > -		reg = <0 0xee100000 0 0x200>;
> > +		reg = <0 0xee100000 0 0x384>;
> 
> All other r8a779x.dtsi have 0x328 there.

Wow! I wonder how I managed that.
