Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:8077 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750881AbeEGNmY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 May 2018 09:42:24 -0400
Subject: Re: igt trouble with planes shared between multiple CRTCs (Re: [PATCH
 v2 0/8] R-Car DU: Support CRC calculation)
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht@gmail.com>,
        IGT development <igt-dev@lists.freedesktop.org>
References: <20180422223430.16407-1-laurent.pinchart+renesas@ideasonboard.com>
 <3482108.jirjkbZynl@avalon> <20180430145524.GJ12521@phenom.ffwll.local>
 <20180430145640.GK12521@phenom.ffwll.local>
 <0f7c2e60-23d0-b222-c8c0-36b17f1e7c25@linux.intel.com>
 <20180502073240.GU12521@phenom.ffwll.local>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <de2d90aa-82ff-7e33-b3f6-cb8cb5072bf4@linux.intel.com>
Date: Mon, 7 May 2018 15:28:19 +0200
MIME-Version: 1.0
In-Reply-To: <20180502073240.GU12521@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Op 02-05-18 om 09:32 schreef Daniel Vetter:
> On Tue, May 01, 2018 at 10:58:02AM +0200, Maarten Lankhorst wrote:
>> Hey,
>>
>> Op 30-04-18 om 16:56 schreef Daniel Vetter:
>>> On Mon, Apr 30, 2018 at 04:55:24PM +0200, Daniel Vetter wrote:
>>>> On Sat, Apr 28, 2018 at 12:07:04AM +0300, Laurent Pinchart wrote:
>>>>> Hi Daniel,
>>>>>
>>>>> (Removing the linux-media mailing list from CC as it is out of scope)
>>>>>
>>>>> You enquired on IRC whether this patch series passes the igt CRC tests.
>>>>>
>>>>> # ./kms_pipe_crc_basic --run-subtest read-crc-pipe-A
>>>>> IGT-Version: 1.22-gf447f5fc531d (aarch64) (Linux: 4.17.0-rc1-00085-g56e849d93cc9 aarch64)
>>>>> read-crc-pipe-A: Testing connector LVDS-1 using pipe A
>>>>> (kms_pipe_crc_basic:1638) igt-debugfs-CRITICAL: Test assertion failure function igt_pipe_crc_start, file igt_debugfs.c:764:
>>>>> (kms_pipe_crc_basic:1638) igt-debugfs-CRITICAL: Failed assertion: pipe_crc->crc_fd != -1
>>>>> (kms_pipe_crc_basic:1638) igt-debugfs-CRITICAL: Last errno: 5, Input/output error
>>>>> Stack trace:
>>>>> Subtest read-crc-pipe-A failed.
>>>>> **** DEBUG ****
>>>>> (kms_pipe_crc_basic:1638) DEBUG: Test requirement passed: !(pipe >= data->display.n_pipes)
>>>>> (kms_pipe_crc_basic:1638) INFO: read-crc-pipe-A: Testing connector LVDS-1 using pipe A
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display: LVDS-1: set_pipe(A)
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display: LVDS-1: Selecting pipe A
>>>>> (kms_pipe_crc_basic:1638) DEBUG: Clearing the fb with color (0.00,1.00,0.00)
>>>>> (kms_pipe_crc_basic:1638) igt-fb-DEBUG: igt_create_fb_with_bo_size(width=1024, height=768, format=0x34325258, tiling=0x0, size=0)
>>>>> (kms_pipe_crc_basic:1638) igt-fb-DEBUG: igt_create_fb_with_bo_size(handle=1, pitch=4096)
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: Test requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display: A.0: plane_set_fb(140)
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display: A.0: plane_set_size (1024x768)
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display: A.0: fb_set_position(0,0)
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display: A.0: fb_set_size(1024x768)
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display: commit {
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     LVDS-1: SetCrtc pipe A, fb 140, src (0, 0), mode 1024x768
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetCrtc pipe A, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe A, plane 2, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe A, plane 3, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe A, plane 4, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetCrtc pipe B, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe B, plane 1, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe B, plane 2, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe B, plane 3, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe B, plane 4, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetCrtc pipe C, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe C, plane 1, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe C, plane 2, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe C, plane 3, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe C, plane 4, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetCrtc pipe D, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetCrtc pipe D, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe D, plane 2, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe D, plane 3, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe D, plane 4, disabling
>>>>> (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display: }
>>>>> (kms_pipe_crc_basic:1638) igt-debugfs-DEBUG: Opening debugfs directory '/sys/kernel/debug/dri/0'
>>>>> (kms_pipe_crc_basic:1638) igt-debugfs-DEBUG: Opening debugfs directory '/sys/kernel/debug/dri/0'
>>>>> (kms_pipe_crc_basic:1638) igt-debugfs-CRITICAL: Test assertion failure function igt_pipe_crc_start, file igt_debugfs.c:764:
>>>>> (kms_pipe_crc_basic:1638) igt-debugfs-CRITICAL: Failed assertion: pipe_crc->crc_fd != -1
>>>>> (kms_pipe_crc_basic:1638) igt-debugfs-CRITICAL: Last errno: 5, Input/output error
>>>>> (kms_pipe_crc_basic:1638) igt-core-INFO: Stack trace:
>>>>> ****  END  ****
>>>>> Subtest read-crc-pipe-A: FAIL (0.061s)
>>>>>
>>>>> I think the answer is no, but I don't think it's the fault of this patch
>>>>> series. Opening the CRC data file returns -EIO because the CRTC is not active,
>>>>> and I'm trying to find out why that is the case. The debug log shows a commit
>>>>> that seems strange to me, enabling pipe A and immediately disabling right
>>>>> afterwards. After some investigation I believe that this is caused by sharing
>>>>> primary planes between CRTCs.
>>>>>
>>>>> The R-Car DU groups CRTCs by two and shares 5 planes between the two CRTCs of
>>>>> the group. This specific SoC has two groups of two CRTCs, but that's not
>>>>> relevant here, so we can ignore pipes C and D.
>>>>>
>>>>> Pipes A and B thus shared 5 planes that I will number 0 to 4 for simplicity.
>>>>> The driver sets plane 0 as the primary plane for CRTC A and plane 1 as the
>>>>> primary plane for CRTC B. Planes 2, 3 and 4 are created as overlay planes.
>>>>>
>>>>> When igt iterates over all planes for pipe A, it will first encounter plane 0
>>>>> that has a framebuffer, and thus enables the pipe. It then iterates over
>>>>> plane 1, recognizes it as a primary plane without a framebuffer, and thus
>>>>> disables the pipe. Planes 2, 3 and 4 are recognized as overlay planes and thus
>>>>> don't affect the pipe active state. Pipe B is handled the same way, and igt
>>>>> disables it twice as planes 0 and 1 are primary.
>>>>>
>>>>> I don't know if the fault here is with igt that doesn't properly support this
>>>>> architecture, or with the driver that shouldn't have two primary planes
>>>>> available for a CRTC. In the former case, I'm not sure how to fix it, as I'm
>>>>> not familiar enough with igt to rearchitecture the commit helpers. In the
>>>>> latter case, how would you recommend fixing it on the driver side ?
>>>> I guess thus far no one did run igt on a chip which did have reassignable
>>>> primary planes. The problem here is that it's pretty hard to figure out
>>>> which one is the real primary plane, since with possible CRTCs you could
>>>> have multiple primary planes on 1 CRTC. There's no property or anything
>>>> that explicitly tells you this. Two fixes:
>>>>
>>>> 1. Change drivers to limit primary planes to 1 crtc. Same for cursor
>>>>    overlays. There's probably other userspace than igt that gets confused
>>>>    by this, but this has the ugly downside that we artifically limit plane
>>>>    usage - if only 1 CRTC is on, we want to use all the available planes
>>>>    on that one.
>>>>
>>>> 2. Add some implicit or explicit uapi to allow userspace to figure out
>>>>    which primary plane is the primary plane for this crtc.
>>>>
>>>>    a) Explicit option: We add a PRIMARY_ID property (and CURSOR_ID prop
>>>>       while at it) on the CRTC which points at the primary/cursor plane.
>>>>
>>>>    b) Implicit option: We require primary planes are assigned to CRTC in the
>>>>       same order as they're created. So first primary plane you encouter
>>>>       is the one for the first CRTC, 2nd primary plane is the one for the
>>>>       2nd CRTC and so on. If we go with this we probably should add a bit
>>>>       of code to the kernel to check that invariant (by making sure the
>>>>       primary plane has the corresponding CRTC included in its
>>>>       possible_crtc mask).
>>>>
>>>> Either way igt needs to be patched to not treat any primary plane that
>>>> could work on a CRTC as the primary plane for that CRTC.
>>>>
>>>> Personally I'm leaning towards 2b).
>>> Adding Maarten and igt-dev.
>> We should first make the plane array global, instead of per crtc.
>>
>> That means removing plane->pipe and plane->index.
>>
>> And pipe_obj->planes and pipe_obj->n_planes need to be gone too. I think it's
>> easiest to make
>>
>> There is one problem. Most of the tests are not aware of the limitations.
>> If we make the plane array global it should be possible to make
>> a for_each_possible_plane_on_pipe enumerate all planes that could be assigned
>> to a certain pipe. We need to sort by z order somehow, but if we then add
>> igt_plane_set_pipe() which updates the IGT_PLANE_CRTC_ID property, we should
>> be good.
>>
>> Only thing we don't see is how the default crtc->primary and crtc->cursor are
>> assigned. For the calls with COMMIT_LEGACY we need to know the mappings, but
>> I don't think the kernel exposes them?
>> I guess we could put it in a FIFO way, first enumerated plane with PRIMARY type
>> is bound to the first crtc, same for cursor.
> Solutions for that problem is what I proposed in my mail, since atm the
> kernel is indeed not exposing that in any fasion.
>
>> This will hopefully allow legacy tests to keep working, while atomic plane aware
>> tests will be able to use all planes.
> Yeah ..
> -Daniel

For reference: https://patchwork.freedesktop.org/series/42814/

The part where planes are reassigned isn't done yet, but that will depend on the final kernel api.

~Maarten
