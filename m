Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 3/5] logger: Log to the FTrace buffer if tracing is
 enabled
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kbingham@kernel.org>
References: <1480082356-23380-1-git-send-email-kbingham@kernel.org>
 <1480082356-23380-4-git-send-email-kbingham@kernel.org>
 <2017783.bbo1Ya7scD@avalon>
Cc: linux-renesas-soc@vger.kernel.org
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <b991400b-2429-c353-6629-f21c42b30f53@ideasonboard.com>
Date: Fri, 25 Nov 2016 18:10:10 +0000
MIME-Version: 1.0
In-Reply-To: <2017783.bbo1Ya7scD@avalon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On 25/11/16 17:40, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Friday 25 Nov 2016 13:59:14 Kieran Bingham wrote:
>> From: Kieran Bingham <kieran@bingham.xyz>
>>
>> Extend the logger such that it will detect the tracing system, and also
>> append print statement to this ring buffer.
>>
>> This provides the relevant logging output interspersed in the ftrace
>> logs for an effective solution to identifying the actions that caused
>> the traces to occur
>>
>> Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
>> ---
>>  scripts/logger.sh | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/logger.sh b/scripts/logger.sh
>> index 8123f0c9f6e3..8412b0ba9a08 100755
>> --- a/scripts/logger.sh
>> +++ b/scripts/logger.sh
>> @@ -6,6 +6,17 @@ now() {
>>
>>  label=${1:+ [$1]}
>>
>> +TRACE_MARKER=/sys/kernel/debug/tracing/trace_marker
>> +if [ -e $TRACE_MARKER ]; then
>> +	extra_log_files=$TRACE_MARKER
>> +fi
>> +
>>  while read line ; do
>> -	echo "$(now)$label $line"
>> +	newline="$(now)$label $line"
>> +
>> +	echo "$newline"
>> +
>> +	for f in $extra_log_files; do
>> +		echo "$newline" >> $f;
> 
> As the tracer adds a timestamp, should you echo "$label $line" only here ?

Hrm, yes it is possibly a little bit redundant...

My only argument would be that it will be a 'different' timestamp to the
one logged by logger.sh.

Inspection of a recent log shows a difference of around 40-50 ms, which
will be the latency between capturing the time in $(now) and passing the
buffer to the kernel.

At this level though, the logger.sh is already susceptible to scheduler
jitter anyway, so I'm not too worried about 40 ms. But anyone reading
the logs will have to be aware of that extra latency.


> 
>> +	done;
>>  done
> 
