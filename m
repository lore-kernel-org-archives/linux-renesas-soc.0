Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34477 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750928AbeETKr4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 May 2018 06:47:56 -0400
Received: by mail-lf0-f68.google.com with SMTP id x145-v6so7909077lff.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 May 2018 03:47:55 -0700 (PDT)
Date: Sun, 20 May 2018 12:47:53 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 1/2] vsp-lib: Capture the kernel log messages in test log
 files
Message-ID: <20180520104753.GA5115@bigcity.dyn.berto.se>
References: <20180519203426.25711-1-laurent.pinchart@ideasonboard.com>
 <20180519203426.25711-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180519203426.25711-2-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thanks for your patch.

On 2018-05-19 23:34:25 +0300, Laurent Pinchart wrote:
> It can be useful to capture kernel log messages in test log files for
> diagnostic purpose. Add a simple mechanism to do so by capturing the
> full kernel log at the end of the test. The kernel log is cleared first
> before starting the test to avoid capturing unrelated messages.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  scripts/vsp-lib.sh | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> index 0f3992a7827e..e672686a377e 100755
> --- a/scripts/vsp-lib.sh
> +++ b/scripts/vsp-lib.sh
> @@ -1075,6 +1075,9 @@ test_init() {
>  	echo "Using device $mdev ($dev)" | ./logger.sh config >> $logfile
>  
>  	vsp_runner=./vsp-runner.sh
> +
> +	# Clear the kernel log
> +	dmesg -c > /dev/null

I agree it's useful to capture the kernel log messages during a test, I 
did the same thing in vin-tests. What I did learn was that when 
something do go wrong you kind of want the whole kernel log from boot 
and truncating it could be annoying. Just the other day I got feed up 
with this in vin-tests and found a different way, as it's still fresh in 
my memory maybe it could be useful for you too, or not :-)

    marker=$(dmesg | tail -n 1 | sed 's/^\[\([^]]*\)\].*/\1/g')


>  }
>  
>  test_start() {
> @@ -1086,6 +1089,8 @@ test_complete() {
>  	echo "Done: $1" | ./logger.sh >> $logfile
>  	echo $1 >&2
>  
> +	dmesg -c | ./logger.sh kernel >> $logfile
> +

        dmesg | sed "1,/$marker/d" | ./logger.sh kernel >> $logfile

>  	rm -f ${frames_dir}frame-*.bin
>  	rm -f ${frames_dir}histo-*.bin
>  	rm -f ${frames_dir}rpf.*.bin
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas S�derlund
