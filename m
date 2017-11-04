Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38187 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751612AbdKDXcC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Nov 2017 19:32:02 -0400
Subject: Re: v4l: async: Match parent devices
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
References: <3e6fde3f-4197-366b-f3b0-d726d6d75165@linux.intel.com>
 <d7086504-afc6-fcf8-fa9a-4e8c170acadc@ideasonboard.com>
 <20171104104724.GE24132@bigcity.dyn.berto.se>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <a646e6f3-0cf7-5e83-4d21-db21cc557db7@ideasonboard.com>
Date: Sat, 4 Nov 2017 23:31:57 +0000
MIME-Version: 1.0
In-Reply-To: <20171104104724.GE24132@bigcity.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas, Sakari,

On 04/11/17 10:47, Niklas Söderlund wrote:
>>
>> Hi Sakari,
>>
>> Niklas was asking me about this patch, as it's required for our async work - and
>> it bit him when he realised this patch wasn't in his tree after a rebase.
> 
> This is currently not a requirement for the async work I do. I was 
> trying out if the rcar-csi2 driver could use the new fwnode helpers to 
> parse DT to setup its sub-notifier. I did the tests using the adv748x as 
> the upstream subdevice, and as you know it registers it subdevices using 
> endpoints and not the parent node, hence I ran into trouble with the 
> helper functions and I ended up searching for this patch.
> 
> I'm not blocked by this, and I currently don't plan to work more on this 
> as the rcar-csi2 driver can use its own parsing code as before and it's 
> rather small. But of course if somewhere in the future the helper learns 
> about endpoints and not just the remote parent node the rcar-csi2 driver 
> would be a nice candidate to switch to such a helper.
> 

Aha, Sorry for misrepresenting your position. I thought you were being blocked.

Still it would be good to see the patch land in mainline sometime to help the
ADV748x driver.

> Thanks to both of you for digging up the commit!

--
Kieran
