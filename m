Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCHv2 2/5] scripts: Provide bin2png.sh helper
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <1480627909-19207-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
 <1480627909-19207-3-git-send-email-kieran.bingham+renesas@ideasonboard.com>
 <4992539.3i9E3kRg7r@avalon>
Cc: linux-renesas-soc@vger.kernel.org
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <7cc4fc1a-cd4b-a3ac-7450-48deffd30d27@ideasonboard.com>
Date: Mon, 20 Feb 2017 17:47:25 +0000
MIME-Version: 1.0
In-Reply-To: <4992539.3i9E3kRg7r@avalon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thanks for your integration and cleanups.

One issue arisen to resolve:

On 13/02/17 14:03, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Thursday 01 Dec 2016 21:31:46 Kieran Bingham wrote:
>> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
>>
>> Identify the size and format from the test output filename, and pass
>> to raw2rgbpnm for conversion to a PNM file.
>>
>> From there we can convert easily to a PNG output file.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>>
>> ---
>> v2:
>>
>> - use 'convert' to proces png files to png
>> - strip '.bin' from target filenames
>>
>>  scripts/Makefile   |  2 +-
>>  scripts/bin2png.sh | 36 ++++++++++++++++++++++++++++++++++++
>>  2 files changed, 37 insertions(+), 1 deletion(-)
>>  create mode 100755 scripts/bin2png.sh
>>
>> diff --git a/scripts/Makefile b/scripts/Makefile
>> index 8c452f4c54ce..6586b2989aed 100644
>> --- a/scripts/Makefile
>> +++ b/scripts/Makefile
>> @@ -1,4 +1,4 @@
>> -SCRIPTS=logger.sh vsp-lib.sh
>> +SCRIPTS=$(wildcard *.sh)
>>
>>  all:
>>
>> diff --git a/scripts/bin2png.sh b/scripts/bin2png.sh
>> new file mode 100755
>> index 000000000000..bde1ddfa3eab
>> --- /dev/null
>> +++ b/scripts/bin2png.sh
>> @@ -0,0 +1,36 @@
>> +#!/bin/sh
>> +
>> +FILE="$1"
>> +
>> +PNM=$(echo $FILE | sed -e 's|\.bin$|.pnm|')
> 
> You can write this as
> 
> PNM=${FILE/.bin/.pnm}
> 
>> +PNG=$(echo $FILE | sed -e 's|\.bin$|.png|')
> 
> Ditto.

This change breaks POSIX SH compliance, as reported by shellcheck:

In scripts/bin2png.sh line 7:
        local pnm=${file/%bin/pnm}
                  ^-- SC2039: In POSIX sh, string replacement is not supported.


In scripts/bin2png.sh line 8:
        local png=${file/%bin/png}
                  ^-- SC2039: In POSIX sh, string replacement is not supported.

It also breaks on my system which uses a strict posix compliant shell :D

> 
>> +fmt=$(echo $FILE | sed -e
>> 's|.*-\([[:alnum:]]*\)-\([0-9]*x[0-9]*\).*.bin|\1|') +size=$(echo $FILE |
>> sed -e 's|.*-\([[:alnum:]]*\)-\([0-9]*x[0-9]*\).*.bin|\2|') +
>> +case $fmt in
>> +	yuv410m|yvu410m|yuv411m|yuv420m|yvu420m|yuv422m|yvu422m|yuv444m|
> yvu444m)
>> +		fmt=`echo $fmt | tr '[:lower:]' '[:upper:]'`
>> +		fmt=`echo $fmt | tr 'M' 'P'`
>> +		;;
>> +	nv12m|nv21m|nv16m|nv61m)
>> +		fmt=`echo $fmt | tr '[:lower:]' '[:upper:]'`
>> +		fmt=`echo $fmt | tr -d 'M'`
>> +		;;
>> +	argb555|xrgb555)
>> +		fmt=RGB555X
> 
> raw2rgbpnm doesn't support RGB555X, I think you should use RGB555.
> 
>> +		;;
>> +	argb32|xrgb32)
>> +		fmt=RGB32
>> +		;;
>> +	abgr32|xbgr32)
>> +		fmt=BGR32
>> +		;;
> 
> You could group all those cases by just removing the leading A or X.

Yes, that is a nice cleanup!

> 
> No need to resubmit, I'll fix while applying.
> 
>> +	*)
>> +		fmt=`echo $fmt | tr '[:lower:]' '[:upper:]'`

I see you now convert to upper case in one early stage as well ... that's a good
call.

>> +		;;
>> +esac
>> +
>> +raw2rgbpnm -s $size -f $fmt $FILE $PNM && \
>> +	convert $PNM $PNG
>> +rm $PNM

So - just a revert of the shell string replacement change required. I'll queue
up a patch :D
--
Kieran
