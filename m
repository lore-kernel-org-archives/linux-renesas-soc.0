Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 4 Jan 2017 18:00:02 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will.deacon@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        David Vrabel <david.vrabel@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] swiotlb: Add swiotlb=noforce debug option
Message-ID: <20170104180002.GE31066@e104818-lin.cambridge.arm.com>
References: <1481894922-28828-1-git-send-email-geert+renesas@glider.be>
 <1481894922-28828-4-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481894922-28828-4-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Dec 16, 2016 at 02:28:42PM +0100, Geert Uytterhoeven wrote:
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 21e2d88637050b7a..24fb691b2da5f78d 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3811,10 +3811,11 @@
>  			it if 0 is given (See Documentation/cgroup-v1/memory.txt)
>  
>  	swiotlb=	[ARM,IA-64,PPC,MIPS,X86]
> -			Format: { <int> | force }
> +			Format: { <int> | force | noforce }
>  			<int> -- Number of I/O TLB slabs
>  			force -- force using of bounce buffers even if they
>  			         wouldn't be automatically used by the kernel
> +			noforce -- Never use bounce buffers (for debugging)

Nitpick (bikeshedding, feel free to ignore): "noforce" looks to me like
the current default behaviour if swiotlb= argument is passed. I would
have preferred "never" or "disable" instead, it has a clearer intent.

-- 
Catalin
