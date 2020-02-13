Return-Path: <SRS0=FX64=4B=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4115C2BA83
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Feb 2020 13:28:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4EB1222C2
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Feb 2020 13:28:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y5KKqph7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729674AbgBMN2J (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Feb 2020 08:28:09 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46246 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729588AbgBMN2J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Feb 2020 08:28:09 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0047C504;
        Thu, 13 Feb 2020 14:28:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1581600487;
        bh=7r5VgXxJPmk334blCbjT5q8GXQgKH5jnX+2Maqd9AjI=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Y5KKqph7H/O9qo40IEcoeqVpVX1o60TgN3+Ap0Dngem/IZe12kWPlu1uT+79kgEfC
         dg8dEub2qHQT4yR1V7mI2YRBQ4Z4U48mnraUxgYyr//923aKaTVUMrHLP1d2FosS/t
         WbwTb68BFXIZQlt8Z2hfKrOt2PynEbqiwUkA6+DA=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] max9286: balance v4l2_async refcnting
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
References: <20200212173727.19476-1-kieran.bingham+renesas@ideasonboard.com>
 <20200213102135.2179-1-kieran.bingham+renesas@ideasonboard.com>
 <8636f540-91fc-19ae-3e6a-7a9253c3c802@ideasonboard.com>
 <20200213131152.glfpoxn6bwftmfil@uno.localdomain>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <daa671b3-4236-df62-a40d-fe70af9ef556@ideasonboard.com>
Date:   Thu, 13 Feb 2020 13:28:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200213131152.glfpoxn6bwftmfil@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 13/02/2020 13:11, Jacopo Mondi wrote:
> Hi Kieran!
> 
> On Thu, Feb 13, 2020 at 01:06:31PM +0000, Kieran Bingham wrote:
>> On 13/02/2020 10:21, Kieran Bingham wrote:
>>> When we add fwnodes to V4L2 notifiers through
>>> v4l2_async_notifier_add_subdev they are stored internally in V4L2 core,
>>> and have a reference count released upon any call to
>>> v4l2_async_notifier_cleanup().
>>>
>>> Ensure that any source successfully added to a notifier gets its fwnode
>>> reference count increased accordingly.
>>>
>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>> ---
>>>  drivers/media/i2c/max9286.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
>>> index f3311210a666..62615e6ab710 100644
>>> --- a/drivers/media/i2c/max9286.c
>>> +++ b/drivers/media/i2c/max9286.c
>>> @@ -665,6 +665,11 @@ static int max9286_v4l2_async_register(struct max9286_priv *priv)
>>>  			v4l2_async_notifier_cleanup(&priv->notifier);
>>>  			return ret;
>>>  		}
>>> +
>>> +		/* Balance the refernce counting handled through
>>
>> I've correctly moved this to a new line and fixed up the reference
>> spelling :)
> 
> Good, thanks!
> 
> I think you could squash all of these in the next max9286 iteration!
> 
> Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thankyou, I'll squash and rebase to linux-media/master branch!


 \o/

--
Kieran


> 
> Thanks
>    j
>>
>>> +		 * v4l2_async_notifier_cleanup()
>>> +		 */
>>> +		fwnode_handle_get(source->fwnode);
>>>  	}
>>>
>>>  	priv->notifier.ops = &max9286_notify_ops;
>>>
>>

