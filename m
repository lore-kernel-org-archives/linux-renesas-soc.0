Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37064 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753590AbdHXQDN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 12:03:13 -0400
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 2/2] README: Document need for killall command
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <1503528064-10454-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
 <1503528064-10454-3-git-send-email-kieran.bingham+renesas@ideasonboard.com>
 <1699997.AfhkDGHqSO@avalon>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <eed25a61-b24f-d462-b40f-d8824441671f@ideasonboard.com>
Date: Thu, 24 Aug 2017 17:03:08 +0100
MIME-Version: 1.0
In-Reply-To: <1699997.AfhkDGHqSO@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On 24/08/17 10:36, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Thursday, 24 August 2017 01:41:04 EEST Kieran Bingham wrote:
>> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
>>
>> The killall command is provided by the psmisc package on debian based
>> systems. On other systems it should be built or added to the filesystem as
>> appropriate.
>>
>> Also remove unnecessary blank line.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> ---
>>  README | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/README b/README
>> index e503a2c41aef..7efcef394ae9 100644
>> --- a/README
>> +++ b/README
>> @@ -43,6 +43,7 @@ system in a directory included in $PATH.
>>  * media-ctl (part of v4l-utils, available at
>> git://linuxtv.org/v4l-utils.git) * raw2rgbpnm (available at
>> git://git.retiisi.org.uk/~sailus/raw2rgbpnm.git) * yavta (available at
>> git://git.ideasonboard.org/yavta.git)
>> +* killall (available from the psmisc package)
> 
> I've moved this between compare and media-ctl to keep the dependencies 
> alphabetically sorted.

That's fine with me.

>>  All but the HGO and CLU/LUT tests can be run with the latest version of
>> these tools. To test the HGO, HGT and CLU/LUT, the 'vsp' branch of 'yavta'
>> is currently @@ -53,7 +54,6 @@ tool is not available the corresponding
>> tests will be skipped.
>>
>>  * stress (available at http://people.seas.harvard.edu/~apw/stress/)
>>
>> -
> 
> I like this blank line :-) There are two blank lines before each section title 
> in the README file.
> 

Ah ok, I must have seen two lines and deleted one without looking further.

> Apart from that,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> If you're fine the comments I'll update the patch when applying and push it.

Sure, that's fine.

--
Kieran
