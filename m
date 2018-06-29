Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:50958 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753058AbeF2RA3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Jun 2018 13:00:29 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Gerd Hoffmann <kraxel@redhat.com>
Subject: [PROTO] [VIRTIO] [PATCH 2/2] virtio-gpu: Support host-allocated backing storage
Date: Fri, 29 Jun 2018 20:00:41 +0300
Message-Id: <20180629170041.13722-3-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20180629170041.13722-1-laurent.pinchart@ideasonboard.com>
References: <20180629170041.13722-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The virtio-gpu protocol is based on opaque host resources backed by
guest-allocated memory. This requires transferring data from guest
framebuffers to host display device buffers.

When the host supports VIRGL, the GPU is used for both 2D and 3D
rendering, in which case the memory transfer can take the form of a DMA
operation without incurring significant costs. However, when VIRGL
support isn't available, 2D transfers require a CPU memory copy for
every page flip. Display is slowed down to an unusable state.

To solve this problem, extend the virtio-gpu protocol with the ability
for the host to allocate resource backing storage and map it to the
guest. The allocated memory can then be used directly by the host-side
display device, removing the need for memory copy operations.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 virtio-gpu.tex | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/virtio-gpu.tex b/virtio-gpu.tex
index 34cf493bbcd1..22546cc1748f 100644
--- a/virtio-gpu.tex
+++ b/virtio-gpu.tex
@@ -34,6 +34,7 @@ control queue.
 
 \begin{description}
 \item[VIRTIO_GPU_F_VIRGL (0)] virgl 3D mode is supported.
+\item[VIRTIO_GPU_F_HOST_ALLOC (1)] buffer allocation by the host is supported.
 \end{description}
 
 \subsection{Device configuration layout}\label{sec:Device Types / GPU Device / Device configuration layout}
@@ -90,6 +91,11 @@ height and format along with an identifier. The guest must then attach
 backing store to the resources in order for DMA transfers to
 work. This is like a GART in a real GPU.
 
+Additionally, when the VIRTIO_GPU_F_HOST_ALLOC feature is present, the guest
+can request the host to allocate backing store for resources on its behalf, in
+which case the allocated resources can be accessed by both the host and the
+guest without any need for DMA transfers.
+
 \subsubsection{Device Operation: Create a framebuffer and configure scanout}
 
 \begin{itemize*}
@@ -120,6 +126,18 @@ using VIRTIO_GPU_CMD_SET_SCANOUT and VIRTIO_GPU_CMD_RESOURCE_FLUSH,
 and update the invisible framebuffer using
 VIRTIO_GPU_CMD_TRANSFER_SEND_2D.
 
+\subsubsection{Device Operation: Create a framebuffer from host-allocated memory}
+
+\begin{itemize*}
+\item Create a host resource using VIRTIO_GPU_CMD_RESOURCE_CREATE_2D. This
+  step is identical to the guest-allocated backing store case.
+\item Request the host to allocate the backing storage for the resource just
+  created, using VIRTIO_GPU_CMD_RESOURCE_ALLOC_BACKING.  The host will map the
+  memory to the guest and will return the memory address.
+\item Use VIRTIO_GPU_CMD_SET_SCANOUT, VIRTIO_GPU_CMD_TRANSFER_SEND_2D and
+  VIRTIO_GPU_CMD_RESOURCE_FLUSH as for guest-allocated memory.
+\end{itemize*}
+
 \subsubsection{Device Operation: Multihead setup}
 
 In case two or more displays are present there are different ways to
@@ -171,6 +189,7 @@ enum virtio_gpu_ctrl_type {
         VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D,
         VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING,
         VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING,
+        VIRTIO_GPU_CMD_RESOURCE_ALLOC_BACKING,
 
         /* cursor commands */
         VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
@@ -179,6 +198,7 @@ enum virtio_gpu_ctrl_type {
         /* success responses */
         VIRTIO_GPU_RESP_OK_NODATA = 0x1100,
         VIRTIO_GPU_RESP_OK_DISPLAY_INFO,
+        VIRTIO_GPU_RESP_OK_ALLOC_BACKING,
 
         /* error responses */
         VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
@@ -417,6 +437,34 @@ struct virtio_gpu_resource_detach_backing {
 This detaches any backing pages from a resource, to be used in case of
 guest swapping or object destruction.
 
+\item[VIRTIO_GPU_CMD_RESOURCE_ALLOC_BACKING] Request the host to allocate
+  backing pages for a resource.  Request data is \field{struct
+    virtio_gpu_resource_alloc_backing}.  Response type is
+    VIRTIO_GPU_RESP_OK_ALLOC_BACKING, response data is \field{struct
+    virtio_gpu_resp_resource_alloc_backing}.
+
+\begin{lstlisting}
+struct virtio_gpu_resource_alloc_backing {
+        struct virtio_gpu_ctrl_hdr hdr;
+        le32 resource_id;
+        le32 padding;
+};
+
+struct virtio_gpu_resp_resource_alloc_backing {
+        struct virtio_gpu_ctrl_hdr hdr;
+        le64 addr;
+};
+\end{lstlisting}
+
+This allocates backing store memory for a resource on the host, and maps the
+memory physically contiguous to the guest. The host returns the guest memory
+address in the \field{addr} field. If memory can't be allocated, the response
+is VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY with no data.
+
+When the backing store is detached from the resource with
+VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING, the memory is freed and unmapped from
+the guest.
+
 \end{description}
 
 \subsubsection{Device Operation: cursorq}\label{sec:Device Types / GPU Device / Device Operation / Device Operation: cursorq}
-- 
Regards,

Laurent Pinchart
