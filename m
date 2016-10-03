Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:46080 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751400AbcJCOve (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2016 10:51:34 -0400
Subject: Re: Kernal version Issue
To: Jithin T Raj <jithin.t@tataelxsi.co.in>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
References: <SG2PR0401MB1296E3088D1BF1BCDBB0E3C7D8C20@SG2PR0401MB1296.apcprd04.prod.outlook.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <e6a8cd21-e216-dbb4-8bbb-2bf9c79e59a1@ideasonboard.com>
Date: Mon, 3 Oct 2016 15:51:22 +0100
MIME-Version: 1.0
In-Reply-To: <SG2PR0401MB1296E3088D1BF1BCDBB0E3C7D8C20@SG2PR0401MB1296.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jithin,

On 03/10/16 08:55, Jithin T Raj wrote:

> hi team, I have downloaded Source tree version 4.7.5 from
> kernel.org..I have build image for RCAR E2  by using that..but the
> board is not accepting the kernel..

We would need to know a bit more detail about 'not accepting the kernel'
here.

Has the kernel you built been configured correctly for your target board?

Were there any traces from the serial console at the point of failure?

How are you building for your target, are you using Yocto?, Buildroot?,
or are you cross compiling the kernel yourself?

Looking through some of your other mail postings, I see you are typing
'make -j4' but I can not see what environment you are building in.

> i want to know "Is there any
> special release of kernel for Renesas only?

>From a community support perspective, you should really be looking to
use the mainline. (An official release from kernel.org, or usage of
torvalds/linux.git)

If you are intending to make modifications to the sources, I would
recommend that you use 'git', rather than downloading a specific version
of source tree from kernel.org, as this will help you track the changes
that you make.

Are you familiar with git yet?

You mention that you can not access github, but I see that you have been
able to access kernel.org ...

Are you able to 'clone' a git kernel using http? :

git clone http://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

> if yes can you please
> provide me some links or kernel from www.kernel.org are suitable for
> all Renesas Board? Hopping your reply

To answer that question as carefully as I can:

The mainline kernel is suitable for all *currently supported* Renesas
boards.

For anything else you would need to contact the vendor specifically, or
a specialist consultant to support you.

> Best Regards Jithin T Raj

--
Regards

Kieran Bingham
