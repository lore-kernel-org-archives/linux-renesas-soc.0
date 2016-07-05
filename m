Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH 0/2] Add R8A7792 GPIO support
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
References: <2706182.6XMBucurvj@wasted.cogentembedded.com>
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <66e88d8f-9260-f159-3ea4-b03428675216@cogentembedded.com>
Date: Wed, 6 Jul 2016 00:10:04 +0300
MIME-Version: 1.0
In-Reply-To: <2706182.6XMBucurvj@wasted.cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 07/05/2016 12:10 AM, Sergei Shtylyov wrote:

>    Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20160704-v4.7-rc6' tag. We're adding the R8A7792 GPIO clocks and
> device nodes. These patches depend on the R8A7792/Blanche PFC patchset in order
> to compile and on the R8a7792 PFC driver patchset in order to work properly.

> [1/2] ARM: dts: r8a7792: add GPIO clocks
> [2/2] ARM: dts: r8a7792: add GPIO support

    Didn't run checkpatch.pl on this one. If I did, it would have found the 
stray spaces in the 1st patch, and undocumented binding in the 2nd...
    Will repost RSN!

WBR, Sergei

