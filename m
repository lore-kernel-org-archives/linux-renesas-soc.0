Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:46100 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751479AbcHCRrh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 3 Aug 2016 13:47:37 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hiep Cao Minh <cm-hiep@jinso.co.jp>
Cc: Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
	kuninori morimoto <kuninori.morimoto.gx@renesas.com>,
	magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?utf-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?utf-8?B?J0R1bmfvvJrkurrjgr0n?= <nv-dung@jinso.co.jp>,
	Xuan Truong Nguyen <nx-truong@jinso.co.jp>,
	laurent.pinchart+renesas@ideasonboard.com,
	horms+renesas@verge.net.au, linux-renesas-soc@vger.kernel.org
Subject: Re: The failure summary report for linux stable v4.7
Date: Wed, 03 Aug 2016 20:38:26 +0300
Message-ID: <14575379.WoFtKTTBW3@avalon>
In-Reply-To: <9ba4b58f-173f-71a7-8868-d577a5789a7e@jinso.co.jp>
References: <9ba4b58f-173f-71a7-8868-d577a5789a7e@jinso.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="utf-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Hiep-san,

On Wednesday 03 Aug 2016 20:27:07 Hiep Cao Minh wrote:
> Hi all,
> 
> We would like to report the summary of the failure to ML, starting from
> Linux stable v4.7.
> 
> Before, we only reported each issue to the person in charge at the time
> of issue detection.
> 
> Now we think that the upstream version’s failure status quo should be
> updated usually to all upstream members.
> 
> So, first, we are going to report the Linux upstream issue summary for
> each version full test, then we report each issue to the person in charge.
> 
> Currently, we have full tests of upstream v4.x-rc2 and stable version,
> and reconfirm the issue of rc2 version on v4.x-rc7 (before stable
> version is released).
> 
> Between full test versions, we investigate and analyze the issue. We
> will report the investigated results if find out any useful information.
> 
> Before:
> 
> Only report the issue to the person in charge at the time of issue
> detection.
> 
> Sometimes re-report the issue to the person in charge.
> 
> After:
> 
> Usually update and report the summary of the issue to all members.
> 
> Usually report each issue and update the status quo to the person in charge.

Thank you for the report. I tried to reproduce the Lager HDMI output issue on 
mainline, and got blocked by the fact that HDMI output seems completely 
broken. I'm investigating that and will provide a fix, and then move on to the 
issue you've reported.

-- 
Regards,

Laurent Pinchart
