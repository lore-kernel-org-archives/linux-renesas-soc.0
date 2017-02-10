Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 2/5] vsp-lib: Filter non-filesystem regular characters
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com>
 <9205d7a3e6fa64aa86ddc99d88b84008213015e7.1486562055.git-series.kieran.bingham@ideasonboard.com>
 <4109815.N8jzog9Deg@avalon>
Cc: linux-renesas-soc@vger.kernel.org
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <96989527-c31a-3696-4b75-92eb07005d38@ideasonboard.com>
Date: Fri, 10 Feb 2017 09:08:24 +0000
MIME-Version: 1.0
In-Reply-To: <4109815.N8jzog9Deg@avalon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thanks for the review!

On 10/02/17 07:58, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Wednesday 08 Feb 2017 14:03:57 Kieran Bingham wrote:
>> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
>>
>> Parameters can contain characters not suited to use in filenames.
>>
>> Add '=','(', and ')' to the filtering, and replace with '_'
> 
> What's the issue with those characters ? :-)

Actually, now I think about it; the real issue is they break my automated file
conversion scripts.

The '=' breaks Makefile wildcard matching, and the '(', just cause extra
escaping to be required on the command line, when I try to examine the output files.

It could easily be argued that those cases could be handled elsewhere, but it
seemed easy to 'clean' the filename.

>> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> ---
>>  scripts/vsp-lib.sh | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
>> index 5aff30217a27..08bf8f36c582 100755
>> --- a/scripts/vsp-lib.sh
>> +++ b/scripts/vsp-lib.sh
>> @@ -263,6 +263,9 @@ compare_frames() {
>>  	local params=${args// /-}
>>  	params=${params:+-$params}
>>  	params=${params//\//_}
>> +	params=${params/=/_}
>> +	params=${params/(/_}
>> +	params=${params/)/_}
> 
> According to the bash manpage,
> 
> "If pattern begins with /, all matches of pattern are replaced with string.  
> Normally only the first match is replaced."
> 
> Shouldn't you add a leading / as for the \/ substitution ?

I tried that when I copied the existing line, but it caused breakage. But of
course my shell is 'busybox sh' and not bash ...

Hrm ... I've just retested on a local script, and it worked fine.
# ./k.sh
abc=def(ghi)jkl
abc_def(ghi)jkl
abc_def_ghi)jkl
abc_def_ghi_jkl

... So I must have been trying to work around a 'non-error' :D

--
Kieran

>>  	params=$in_fmt-$out_fmt-$size$params
>>
>>  	if [ x$__vsp_pixel_perfect != xtrue ] ; then
> 
