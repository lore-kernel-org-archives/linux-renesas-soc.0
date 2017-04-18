Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:51561 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932227AbdDRJna (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 05:43:30 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [GIT PULL FOR renesas-drivers] VSP1 rotation and histogram
Date: Tue, 18 Apr 2017 12:44:30 +0300
Message-ID: <1668462.fZsTFAiXAs@avalon>
In-Reply-To: <CAMuHMdUJmBsO6oU7Ne1w8gx-Ew4PRFrV6XRcmpBKVrQ548vzhA@mail.gmail.com>
References: <4407429.F5AJ3MCJrM@avalon> <11572546.LuaYKYJzSt@avalon> <CAMuHMdUJmBsO6oU7Ne1w8gx-Ew4PRFrV6XRcmpBKVrQ548vzhA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Tuesday 18 Apr 2017 11:40:53 Geert Uytterhoeven wrote:
> On Tue, Apr 18, 2017 at 11:35 AM, Laurent Pinchart wrote:
> > On Tuesday 18 Apr 2017 11:01:59 Geert Uytterhoeven wrote:
> >> On Mon, Mar 6, 2017 at 1:47 AM, Laurent Pinchart wrote:
> >> > The following changes since commit
> >> > 130f8756b9b83c0137ee0d587152a7ef3e10f74b:
> >> >   v4l: vsp1: Register pipe with output WPF (2017-03-05 01:53:46 +0200)
> >> > 
> >> > are available in the git repository at:
> >> >   git://linuxtv.org/pinchartl/media.git vsp1/histogram
> >> 
> >> Dropped, too many conflicts.
> > 
> > And the code is in the linuxtv master branch anyway, scheduled for merge
> > in v4.12-rc1.
> 
> Not the HGO and HGT support, cfr.
> 
>     git cherry -v next-20170418  8bcdadfb22f218a4

>From next-20170418:

0ac702d5b903 [media] v4l: vsp1: Add HGT support
f2421521de18 [media] v4l: vsp1: Add HGO support
98eee2550f7b [media] v4l: vsp1: Fix HGO and HGT routing register addresses
c8663c8e15c9 [media] v4l: vsp1: Support histogram generators in pipeline 
configuration
99362e32332b [media] v4l: vsp1: Add histogram support
3e9a0e0bfafd [media] v4l: vsp1: wpf: Implement rotation support

-- 
Regards,

Laurent Pinchart
