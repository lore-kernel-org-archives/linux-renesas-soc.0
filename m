Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:47759 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933938AbdKPKyU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2017 05:54:20 -0500
Subject: Re: [PATCH 3/3] vin-tests: Refactor mc_get_dev
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <1510756711-6488-1-git-send-email-kbingham@kernel.org>
 <1510756711-6488-4-git-send-email-kbingham@kernel.org>
 <20171115165153.GI12677@bigcity.dyn.berto.se>
Reply-To: kieran.bingham@ideasonboard.com
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <6cef8fe4-1320-1360-f55c-3faea595bddb@ideasonboard.com>
Date: Thu, 16 Nov 2017 10:54:16 +0000
MIME-Version: 1.0
In-Reply-To: <20171115165153.GI12677@bigcity.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On 15/11/17 16:51, Niklas Söderlund wrote:
> Hi Kieran,
> 
> Thanks for your patch.
> 
> Unfortunately I experience some problems with this patch.

My apologies, I thought this was working when I used it, it was left in my local
branch and hadn't been sent (along with the other two) and I thought they were
all in use on my board. It looks like somehow I've maybe saved my earlier
development patch, perhaps instead of the one that was working on the board and
it's not correct. I'm sorry for that.


> On 2017-11-15 14:38:31 +0000, Kieran Bingham wrote:
>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> Rather that using shell parsing of each file when looking for a device
>> node, use a combination of grep and sed to identify the device.
>>
>> This is a remarkable speed optimisation for this code segment.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> ---
>>  scripts/vin-tests.sh | 14 +++-----------
>>  1 file changed, 3 insertions(+), 11 deletions(-)
>>
>> diff --git a/scripts/vin-tests.sh b/scripts/vin-tests.sh
>> index 7c81aa51c1c5..2e6214bc95e6 100644
>> --- a/scripts/vin-tests.sh
>> +++ b/scripts/vin-tests.sh
>> @@ -99,17 +99,9 @@ mc_get_mdev() {
>>  }
>>  
>>  mc_get_dev() {
>> -    name=$1
>> -    mdev=$(mc_get_mdev)
>> -
>> -    for dev in  /sys/class/video4linux/*; do
>> -        if [[ "$(cat $dev/name)" == "$name" ]]; then
>> -            basename $dev
>> -            return 0
>> -        fi
>> -    done
>> -
>> -    error "Can't find device"
>> +    name="$1"
>> +    grep -l "$name" /sys/class/video4linux/video*/name | \
>> +	    sed 's#.*video4linux\(.*\)/name#/dev\1#g'
> 
> The only user of mc_get_dev() is the set-edid utility, which uses it to 
> find the adv748x HDMI subdevice (adv748x 4-0070 hdmi) so it can program 
> the EDID. I had to change search path above to 
> /sys/class/video4linux/*/name to also searches in v4l-subdevX 
> directories to find thatt device.

Yes, that is a change in input parameters and output parameters in my patch as I
submitted. Which was clearly just a bit wrong :)

> 
> Also the return value changes from 'v4l-subdev42' to /dev/v4l-subdev42' 
> so the set-edid tool needed a small update to handle that :-)

Yes, this should have been more like:

grep "$name" /sys/class/video4linux/*/name | \
	sed 's#.*video4linux/\(.*\)/name.*#\1#g'

> I have applied this patch as-is, and then a followup which takes care of 
> the above. Out of curiosity, are you working on any new tests which uses 
> mc_get_dev()?

This was a patch I mentioned to you back when I had written it but hadn't
submitted. Clearly it looks like I was doing something different as I had indeed
changed the output return value. Which looks quite intentional, in the above.

For the moment - I'm going to put this down to baby-brain ... and pretend it
didn't happen ... then try to make sure I don't do something equally as silly again.

Sorry for the noise, and thank you for fixing it up! :-)
--
Kieran
