Return-Path: <periperi-bounces@horms.net>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
References: <3e6fde3f-4197-366b-f3b0-d726d6d75165@linux.intel.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <d7086504-afc6-fcf8-fa9a-4e8c170acadc@ideasonboard.com>
Date: Fri, 3 Nov 2017 23:23:25 +0000
MIME-Version: 1.0
In-Reply-To: <3e6fde3f-4197-366b-f3b0-d726d6d75165@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Cc: "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>, "periperi@horms.net" <periperi@horms.net>
Subject: Re: [periperi] v4l: async: Match parent devices
List-Unsubscribe: <https://lists.vergenet.net/options/periperi>,
 <mailto:periperi-request@horms.net?subject=unsubscribe>
List-Archive: <https://lists.vergenet.net/private/periperi/>
List-Post: <mailto:periperi@horms.net>
List-Help: <mailto:periperi-request@horms.net?subject=help>
List-Subscribe: <https://lists.vergenet.net/listinfo/periperi>,
 <mailto:periperi-request@horms.net?subject=subscribe>
Errors-To: periperi-bounces@horms.net
Sender: "periperi" <periperi-bounces@horms.net>
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas, Sakari,


Niklas, the Match parent devices patch is in Sakari's fwnode-const branch as far
as I know, but hasn't been updated since May ...

Hi Sakari,

Niklas was asking me about this patch, as it's required for our async work - and
it bit him when he realised this patch wasn't in his tree after a rebase.

Is this fwnode-const branch still the right place for this patch ? What's the
progress on this series ?

--
Regards

Kieran


On 01/06/17 16:55, Sakari Ailus wrote:
> It's here:
> 
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=fwnode-const>
> 
> The reason is that it depends on the V4L2 fwnode patches as well as the
> fwnode cleanup patches. It may well be possible to get it in earlier
> than the fwnode const patches, but for practical reasons it's in the
> same branch.
> 
