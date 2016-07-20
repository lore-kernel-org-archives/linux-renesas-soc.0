Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48074 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753019AbcGTXv6 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 20 Jul 2016 19:51:58 -0400
Date: Thu, 21 Jul 2016 08:51:54 +0900
From: Simon Horman <horms@verge.net.au>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: r8a7796: Add Renesas R8A7796 SoC
 support
Message-ID: <20160720235154.GA21407@verge.net.au>
References: <1464054880-25843-1-git-send-email-horms+renesas@verge.net.au>
 <1464054880-25843-2-git-send-email-horms+renesas@verge.net.au>
 <b30c9c84-23b6-b088-4983-b2498317492b@de.bosch.com>
 <20160525004825.GC7292@verge.net.au>
 <c0fd13d5-c5c4-579b-6fad-c637bda92398@de.bosch.com>
 <20160526022833.GE18393@verge.net.au>
 <59e6225a-6dfa-8bde-dd2e-3428d6fedfe2@de.bosch.com>
 <20160527004256.GD14269@verge.net.au>
 <b03c68c9-6949-519d-2c44-c140eac727a4@de.bosch.com>
 <d0b2edc9-c191-d61c-add0-85f189083931@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0b2edc9-c191-d61c-add0-85f189083931@de.bosch.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 29, 2016 at 10:15:27AM +0200, Dirk Behme wrote:
> Hi Simon,

...

> Hmm, could you kindly help me to remember what's the recent status of your
> discussion above regarding a hierarchical structure of the RCar3 device
> trees?

Hi Dirk,

>From my point of view the most promising avenue at this time is work that
Geert has been doing to explore making things more flexible by updating the
DT automatically at run time. He can expand on this but the idea is to add
per-soc compat strings and otherwise update the DT into a per-SoC version.
This ought to allow significant portions of the DT to be common between
SoCs in the same R-Car generation for at lest Gen 2 and Gen 3.
