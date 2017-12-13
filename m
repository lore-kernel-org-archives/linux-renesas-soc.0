Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:53029 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750745AbdLMXnJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 18:43:09 -0500
Subject: Re: [PATCH] kmstest.py: Update to th latest kmsxx Python bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
References: <20171207183312.27962-1-laurent.pinchart@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <4460d0d8-75fd-a8ea-30ef-8d42c5cb47c1@ideasonboard.com>
Date: Wed, 13 Dec 2017 23:43:05 +0000
MIME-Version: 1.0
In-Reply-To: <20171207183312.27962-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thankyou for this patch. It successfully allows me to use the latest kmsxx,
rather than a much older base that I had been sat on.

Your commit title could do with an 'e' after 'th', but otherwise this patch is
good :D

On 07/12/17 18:33, Laurent Pinchart wrote:
> Commit 706a44abb3aa ("Update to latest pybind11") of kmsxx broke the
> test suite by changing the signature of the AtomicRequest::commit
> function. Update the test suite accordingly.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  tests/kmstest.py | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> The aforementioned commit also broke the test suite due to two other issues
> that need to be fixed in kmsxx. Two patches have been submitted for upstream
> inclusion, they can in the meantime be found at
> 
> 	git://git.ideasonboard.com/renesas/kmsxx.git master
> 
> diff --git a/tests/kmstest.py b/tests/kmstest.py
> index 45d619c7a9be..7de785edd1e3 100755
> --- a/tests/kmstest.py
> +++ b/tests/kmstest.py
> @@ -238,7 +238,7 @@ class KMSTest(object):
>          if sync:
>              return req.commit_sync(True)
>          else:
> -            return req.commit(self, True)
> +            return req.commit(0, True)
>  
>      def atomic_crtc_mode_set(self, crtc, connector, mode, fb=None, sync=False):
>          """Perform a mode set on the given connector and CRTC. The framebuffer,
> @@ -268,7 +268,7 @@ class KMSTest(object):
>          if sync:
>              return req.commit_sync(True)
>          else:
> -            return req.commit(self, True)
> +            return req.commit(0, True)
>  
>      def atomic_plane_set(self, plane, crtc, source, destination, fb, sync=False):
>          req = pykms.AtomicReq(self.card)
> @@ -287,7 +287,7 @@ class KMSTest(object):
>          if sync:
>              return req.commit_sync()
>          else:
> -            return req.commit(self)
> +            return req.commit(0)
>  
>      def atomic_planes_disable(self, sync=True):
>          req = pykms.AtomicReq(self.card)
> @@ -297,7 +297,7 @@ class KMSTest(object):
>          if sync:
>              return req.commit_sync()
>          else:
> -            return req.commit(self)
> +            return req.commit(0)
>  
>      def __handle_page_flip(self, frame, time):
>          self.flips += 1
> 
