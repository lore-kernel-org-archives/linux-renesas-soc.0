Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:52764 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756599AbdKDKr2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Nov 2017 06:47:28 -0400
Received: by mail-lf0-f42.google.com with SMTP id b190so5723617lfg.9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Nov 2017 03:47:27 -0700 (PDT)
Date: Sat, 4 Nov 2017 11:47:25 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: v4l: async: Match parent devices
Message-ID: <20171104104724.GE24132@bigcity.dyn.berto.se>
References: <3e6fde3f-4197-366b-f3b0-d726d6d75165@linux.intel.com>
 <d7086504-afc6-fcf8-fa9a-4e8c170acadc@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7086504-afc6-fcf8-fa9a-4e8c170acadc@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran and Sakari,

On 2017-11-03 23:23:25 +0000, Kieran Bingham wrote:
> Hi Niklas, Sakari,
> 
> 
> Niklas, the Match parent devices patch is in Sakari's fwnode-const branch as far
> as I know, but hasn't been updated since May ...

Thanks, I have not located the patch! I was just surprised I observed 
some behavior in async when hacking which seemed like this patch was 
present but I could not find it in the tree :-)

> 
> Hi Sakari,
> 
> Niklas was asking me about this patch, as it's required for our async work - and
> it bit him when he realised this patch wasn't in his tree after a rebase.

This is currently not a requirement for the async work I do. I was 
trying out if the rcar-csi2 driver could use the new fwnode helpers to 
parse DT to setup its sub-notifier. I did the tests using the adv748x as 
the upstream subdevice, and as you know it registers it subdevices using 
endpoints and not the parent node, hence I ran into trouble with the 
helper functions and I ended up searching for this patch.

I'm not blocked by this, and I currently don't plan to work more on this 
as the rcar-csi2 driver can use its own parsing code as before and it's 
rather small. But of course if somewhere in the future the helper learns 
about endpoints and not just the remote parent node the rcar-csi2 driver 
would be a nice candidate to switch to such a helper.

Thanks to both of you for digging up the commit!

> 
> Is this fwnode-const branch still the right place for this patch ? What's the
> progress on this series ?
> 
> --
> Regards
> 
> Kieran
> 
> 
> On 01/06/17 16:55, Sakari Ailus wrote:
> > It's here:
> > 
> > <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=fwnode-const>
> > 
> > The reason is that it depends on the V4L2 fwnode patches as well as the
> > fwnode cleanup patches. It may well be possible to get it in earlier
> > than the fwnode const patches, but for practical reasons it's in the
> > same branch.
> > 

-- 
Regards,
Niklas S�derlund
