Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:46794 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756739AbdLOPQW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 10:16:22 -0500
Received: by mail-wm0-f67.google.com with SMTP id r78so18192509wme.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 07:16:21 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 1/7] drm/img-rogue: adapt to changed fence API
Date: Fri, 15 Dec 2017 16:15:39 +0100
Message-Id: <1513350945-2642-2-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1513350945-2642-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1513350945-2642-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Everything "fence..." is now "dma_fence...".

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 kernel/drivers/staging/imgtec/pvr_buffer_sync.c | 38 +++++++-------
 kernel/drivers/staging/imgtec/pvr_fence.c       | 68 ++++++++++++-------------
 kernel/drivers/staging/imgtec/pvr_fence.h       | 20 ++++----
 3 files changed, 63 insertions(+), 63 deletions(-)

diff --git a/kernel/drivers/staging/imgtec/pvr_buffer_sync.c b/kernel/drivers/staging/imgtec/pvr_buffer_sync.c
index dcb4a32..361b59d 100644
--- a/kernel/drivers/staging/imgtec/pvr_buffer_sync.c
+++ b/kernel/drivers/staging/imgtec/pvr_buffer_sync.c
@@ -57,7 +57,7 @@ struct pvr_buffer_sync_context {
 };
 
 struct pvr_buffer_sync_check_data {
-	struct fence_cb base;
+	struct dma_fence_cb base;
 
 	u32 nr_fences;
 	struct pvr_fence **fences;
@@ -179,7 +179,7 @@ pvr_buffer_sync_pmrs_fence_count(u32 nr_pmrs, struct _PMR_ **pmrs,
 {
 	struct reservation_object *resv;
 	struct reservation_object_list *resv_list;
-	struct fence *fence;
+	struct dma_fence *fence;
 	u32 fence_count = 0;
 	bool exclusive;
 	int i;
@@ -214,7 +214,7 @@ pvr_buffer_sync_check_fences_create(struct pvr_fence_context *fence_ctx,
 	struct pvr_buffer_sync_check_data *data;
 	struct reservation_object *resv;
 	struct reservation_object_list *resv_list;
-	struct fence *fence;
+	struct dma_fence *fence;
 	u32 fence_count;
 	bool exclusive;
 	int i, j;
@@ -257,7 +257,7 @@ pvr_buffer_sync_check_fences_create(struct pvr_fence_context *fence_ctx,
 			if (!data->fences[data->nr_fences - 1]) {
 				data->nr_fences--;
 				PVR_FENCE_TRACE(fence, "waiting on exclusive fence\n");
-				WARN_ON(fence_wait(fence, true) <= 0);
+				WARN_ON(dma_fence_wait(fence, true) <= 0);
 			}
 		}
 
@@ -272,7 +272,7 @@ pvr_buffer_sync_check_fences_create(struct pvr_fence_context *fence_ctx,
 				if (!data->fences[data->nr_fences - 1]) {
 					data->nr_fences--;
 					PVR_FENCE_TRACE(fence, "waiting on non-exclusive fence\n");
-					WARN_ON(fence_wait(fence, true) <= 0);
+					WARN_ON(dma_fence_wait(fence, true) <= 0);
 				}
 			}
 		}
@@ -304,7 +304,7 @@ pvr_buffer_sync_check_fences_destroy(struct pvr_buffer_sync_check_data *data)
 }
 
 static void
-pvr_buffer_sync_check_data_cleanup(struct fence *fence, struct fence_cb *cb)
+pvr_buffer_sync_check_data_cleanup(struct dma_fence *fence, struct dma_fence_cb *cb)
 {
 	struct pvr_buffer_sync_check_data *data =
 		container_of(cb, struct pvr_buffer_sync_check_data, base);
@@ -551,9 +551,9 @@ pvr_buffer_sync_append_start(struct pvr_buffer_sync_context *ctx,
 	 * Note: we take an additional reference on the update fence in case
 	 * it signals before we can add it to a reservation object.
 	 */
-	fence_get(&data->update_fence->base);
+	dma_fence_get(&data->update_fence->base);
 
-	err = fence_add_callback(&data->update_fence->base, &check_data->base,
+	err = dma_fence_add_callback(&data->update_fence->base, &check_data->base,
 				 pvr_buffer_sync_check_data_cleanup);
 	if (err) {
 		/*
@@ -624,7 +624,7 @@ pvr_buffer_sync_append_finish(struct pvr_buffer_sync_append_data *data)
 	 * objects we can safely drop the extra reference we took in
 	 * pvr_buffer_sync_append_start.
 	 */
-	fence_put(&data->update_fence->base);
+	dma_fence_put(&data->update_fence->base);
 
 	pvr_buffer_sync_pmrs_unlock(&data->ctx->acquire_ctx,
 				    data->nr_pmrs,
@@ -653,7 +653,7 @@ pvr_buffer_sync_append_abort(struct pvr_buffer_sync_append_data *data)
 	 * reference taken in pvr_buffer_sync_append_start.
 	 */
 	pvr_fence_sync_sw_signal(data->update_fence);
-	fence_put(&data->update_fence->base);
+	dma_fence_put(&data->update_fence->base);
 	pvr_buffer_sync_pmrs_unlock(&data->ctx->acquire_ctx,
 				    data->nr_pmrs,
 				    data->pmrs);
@@ -697,7 +697,7 @@ pvr_buffer_sync_wait(struct pvr_buffer_sync_context *ctx,
 {
 	struct reservation_object *resv;
 	struct reservation_object_list *resv_list = NULL;
-	struct fence *fence, *wait_fence = NULL;
+	struct dma_fence *fence, *wait_fence = NULL;
 	unsigned seq;
 	int i;
 	long lerr;
@@ -721,8 +721,8 @@ retry:
 		for (i = 0; i < resv_list->shared_count; i++) {
 			fence = rcu_dereference(resv_list->shared[i]);
 			if (is_our_fence(ctx->fence_ctx, fence) &&
-			    !test_bit(FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-				wait_fence = fence_get_rcu(fence);
+			    !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
+				wait_fence = dma_fence_get_rcu(fence);
 				if (!wait_fence)
 					goto unlock_retry;
 				break;
@@ -737,8 +737,8 @@ retry:
 			goto unlock_retry;
 
 		if (fence &&
-		    !test_bit(FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-			wait_fence = fence_get_rcu(fence);
+		    !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
+			wait_fence = dma_fence_get_rcu(fence);
 			if (!wait_fence)
 				goto unlock_retry;
 		}
@@ -748,16 +748,16 @@ retry:
 	if (wait_fence) {
 		struct pvr_fence *pvr_fence = to_pvr_fence(wait_fence);
 		if (!pvr_fence || pvr_fence->pid != current->pid) {
-			fence_put(wait_fence);
+			dma_fence_put(wait_fence);
 			return 0;
 		}
 
-		if (fence_is_signaled(wait_fence))
+		if (dma_fence_is_signaled(wait_fence))
 			lerr = timeout;
 		else
-			lerr = fence_wait_timeout(wait_fence, intr, timeout);
+			lerr = dma_fence_wait_timeout(wait_fence, intr, timeout);
 
-		fence_put(wait_fence);
+		dma_fence_put(wait_fence);
 		if (!lerr)
 			return -EBUSY;
 		else if (lerr < 0)
diff --git a/kernel/drivers/staging/imgtec/pvr_fence.c b/kernel/drivers/staging/imgtec/pvr_fence.c
index d5b4149..92803f0 100644
--- a/kernel/drivers/staging/imgtec/pvr_fence.c
+++ b/kernel/drivers/staging/imgtec/pvr_fence.c
@@ -104,9 +104,9 @@ pvr_fence_context_fences_dump(struct pvr_fence_context *fctx,
 #endif
 				  pvr_fence->fence->context,
 				  pvr_fence->fence->seqno,
-				  test_bit(FENCE_FLAG_ENABLE_SIGNAL_BIT, &pvr_fence->fence->flags) ? "+" : "-",
-				  test_bit(FENCE_FLAG_SIGNALED_BIT, &pvr_fence->fence->flags) ? "+" : "-",
-				  atomic_read(&pvr_fence->fence->refcount.refcount),
+				  test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &pvr_fence->fence->flags) ? "+" : "-",
+				  test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &pvr_fence->fence->flags) ? "+" : "-",
+				  atomic_read(&pvr_fence->fence->refcount.refcount.refs),
 				  sync_addr,
 				  pvr_fence_sync_value_get(pvr_fence),
 				  PVR_FENCE_SYNC_VAL_SIGNALED,
@@ -148,7 +148,7 @@ static inline void pvr_fence_context_free_deferred(struct pvr_fence_context *fct
 				 fence_head) {
 		list_del(&pvr_fence->fence_head);
 		SyncPrimFree(pvr_fence->sync);
-		fence_free(&pvr_fence->base);
+		dma_fence_free(&pvr_fence->base);
 	}
 }
 
@@ -162,11 +162,11 @@ pvr_fence_context_signal_fences(struct work_struct *data)
 	LIST_HEAD(signal_list);
 
 	/*
-	 * We can't call fence_signal while holding the lock as we can end up
+	 * We can't call dma_fence_signal while holding the lock as we can end up
 	 * in a situation whereby pvr_fence_foreign_signal_sync, which also
 	 * takes the list lock, ends up being called as a result of the
-	 * fence_signal below, i.e. fence_signal(fence) -> fence->callback()
-	 *  -> fence_signal(foreign_fence) -> foreign_fence->callback() where
+	 * dma_fence_signal below, i.e. dma_fence_signal(fence) -> fence->callback()
+	 *  -> dma_fence_signal(foreign_fence) -> foreign_fence->callback() where
 	 * the foreign_fence callback is pvr_fence_foreign_signal_sync.
 	 *
 	 * So extract the items we intend to signal and add them to their own
@@ -187,8 +187,8 @@ pvr_fence_context_signal_fences(struct work_struct *data)
 		PVR_FENCE_TRACE(&pvr_fence->base, "signalled fence (%s)\n",
 				pvr_fence->name);
 		list_del(&pvr_fence->signal_head);
-		fence_signal(pvr_fence->fence);
-		fence_put(pvr_fence->fence);
+		dma_fence_signal(pvr_fence->fence);
+		dma_fence_put(pvr_fence->fence);
 	}
 
 	/*
@@ -241,7 +241,7 @@ pvr_fence_context_create(void *dev_cookie,
 	INIT_LIST_HEAD(&fctx->fence_list);
 	INIT_LIST_HEAD(&fctx->deferred_free_list);
 
-	fctx->fence_context = fence_context_alloc(1);
+	fctx->fence_context = dma_fence_context_alloc(1);
 	fctx->name = name;
 
 	fctx->fence_wq =
@@ -321,13 +321,13 @@ pvr_fence_context_destroy(struct pvr_fence_context *fctx)
 }
 
 static const char *
-pvr_fence_get_driver_name(struct fence *fence)
+pvr_fence_get_driver_name(struct dma_fence *fence)
 {
 	return PVR_LDM_DRIVER_REGISTRATION_NAME;
 }
 
 static const char *
-pvr_fence_get_timeline_name(struct fence *fence)
+pvr_fence_get_timeline_name(struct dma_fence *fence)
 {
 	struct pvr_fence *pvr_fence = to_pvr_fence(fence);
 
@@ -335,7 +335,7 @@ pvr_fence_get_timeline_name(struct fence *fence)
 }
 
 static bool
-pvr_fence_enable_signaling(struct fence *fence)
+pvr_fence_enable_signaling(struct dma_fence *fence)
 {
 	struct pvr_fence *pvr_fence = to_pvr_fence(fence);
 	struct pvr_fence_context *fctx = pvr_fence->fctx;
@@ -347,7 +347,7 @@ pvr_fence_enable_signaling(struct fence *fence)
 				     PVR_FENCE_SYNC_VAL_SIGNALED))
 		return false;
 
-	fence_get(&pvr_fence->base);
+	dma_fence_get(&pvr_fence->base);
 
 	spin_lock_irqsave(&fctx->list_lock, flags);
 	list_add_tail(&pvr_fence->signal_head, &fctx->signal_list);
@@ -360,7 +360,7 @@ pvr_fence_enable_signaling(struct fence *fence)
 }
 
 static bool
-pvr_fence_is_signaled(struct fence *fence)
+pvr_fence_is_signaled(struct dma_fence *fence)
 {
 	struct pvr_fence *pvr_fence = to_pvr_fence(fence);
 
@@ -368,7 +368,7 @@ pvr_fence_is_signaled(struct fence *fence)
 }
 
 static void
-pvr_fence_release(struct fence *fence)
+pvr_fence_release(struct dma_fence *fence)
 {
 	struct pvr_fence *pvr_fence = to_pvr_fence(fence);
 	struct pvr_fence_context *fctx = pvr_fence->fctx;
@@ -384,12 +384,12 @@ pvr_fence_release(struct fence *fence)
 	spin_unlock_irqrestore(&fctx->list_lock, flags);
 }
 
-const struct fence_ops pvr_fence_ops = {
+const struct dma_fence_ops pvr_fence_ops = {
 	.get_driver_name = pvr_fence_get_driver_name,
 	.get_timeline_name = pvr_fence_get_timeline_name,
 	.enable_signaling = pvr_fence_enable_signaling,
 	.signaled = pvr_fence_is_signaled,
-	.wait = fence_default_wait,
+	.wait = dma_fence_default_wait,
 	.release = pvr_fence_release,
 };
 
@@ -429,7 +429,7 @@ pvr_fence_create(struct pvr_fence_context *fctx, const char *name)
 	pvr_fence->fence = &pvr_fence->base;
 
 	seqno = pvr_fence_context_seqno_next(fctx);
-	fence_init(&pvr_fence->base, &pvr_fence_ops, &fctx->lock,
+	dma_fence_init(&pvr_fence->base, &pvr_fence_ops, &fctx->lock,
 		   fctx->fence_context, seqno);
 
 	spin_lock_irqsave(&fctx->list_lock, flags);
@@ -446,33 +446,33 @@ err_free_fence:
 }
 
 static const char *
-pvr_fence_foreign_get_driver_name(struct fence *fence)
+pvr_fence_foreign_get_driver_name(struct dma_fence *fence)
 {
 	return "unknown";
 }
 
 static const char *
-pvr_fence_foreign_get_timeline_name(struct fence *fence)
+pvr_fence_foreign_get_timeline_name(struct dma_fence *fence)
 {
 	return "unknown";
 }
 
 static bool
-pvr_fence_foreign_enable_signaling(struct fence *fence)
+pvr_fence_foreign_enable_signaling(struct dma_fence *fence)
 {
 	WARN_ON("cannot enable signalling on foreign fence");
 	return false;
 }
 
 static signed long
-pvr_fence_foreign_wait(struct fence *fence, bool intr, signed long timeout)
+pvr_fence_foreign_wait(struct dma_fence *fence, bool intr, signed long timeout)
 {
 	WARN_ON("cannot wait on foreign fence");
 	return 0;
 }
 
 static void
-pvr_fence_foreign_release(struct fence *fence)
+pvr_fence_foreign_release(struct dma_fence *fence)
 {
 	struct pvr_fence *pvr_fence = to_pvr_fence(fence);
 	struct pvr_fence_context *fctx = pvr_fence->fctx;
@@ -490,7 +490,7 @@ pvr_fence_foreign_release(struct fence *fence)
 	spin_unlock_irqrestore(&fctx->list_lock, flags);
 }
 
-const struct fence_ops pvr_fence_foreign_ops = {
+const struct dma_fence_ops pvr_fence_foreign_ops = {
 	.get_driver_name = pvr_fence_foreign_get_driver_name,
 	.get_timeline_name = pvr_fence_foreign_get_timeline_name,
 	.enable_signaling = pvr_fence_foreign_enable_signaling,
@@ -499,7 +499,7 @@ const struct fence_ops pvr_fence_foreign_ops = {
 };
 
 static void
-pvr_fence_foreign_signal_sync(struct fence *fence, struct fence_cb *cb)
+pvr_fence_foreign_signal_sync(struct dma_fence *fence, struct dma_fence_cb *cb)
 {
 	struct pvr_fence *pvr_fence = container_of(cb, struct pvr_fence, cb);
 	struct pvr_fence_context *fctx = pvr_fence->fctx;
@@ -516,7 +516,7 @@ pvr_fence_foreign_signal_sync(struct fence *fence, struct fence_cb *cb)
 			pvr_fence->name);
 
 	/* Drop the reference on the base fence */
-	fence_put(&pvr_fence->base);
+	dma_fence_put(&pvr_fence->base);
 }
 
 /**
@@ -536,7 +536,7 @@ pvr_fence_foreign_signal_sync(struct fence *fence, struct fence_cb *cb)
  */
 struct pvr_fence *
 pvr_fence_create_from_fence(struct pvr_fence_context *fctx,
-			    struct fence *fence,
+			    struct dma_fence *fence,
 			    const char *name)
 {
 	struct pvr_fence *pvr_fence = to_pvr_fence(fence);
@@ -548,7 +548,7 @@ pvr_fence_create_from_fence(struct pvr_fence_context *fctx,
 	if (pvr_fence) {
 		if (WARN_ON(fence->ops == &pvr_fence_foreign_ops))
 			return NULL;
-		fence_get(fence);
+		dma_fence_get(fence);
 
 		PVR_FENCE_TRACE(fence, "created fence from PVR fence (%s)\n",
 				name);
@@ -576,14 +576,14 @@ pvr_fence_create_from_fence(struct pvr_fence_context *fctx,
 	 * necessary clean up once the refcount drops to 0.
 	 */
 	seqno = pvr_fence_context_seqno_next(fctx);
-	fence_init(&pvr_fence->base, &pvr_fence_foreign_ops, &fctx->lock,
+	dma_fence_init(&pvr_fence->base, &pvr_fence_foreign_ops, &fctx->lock,
 		   fctx->fence_context, seqno);
 
 	/*
 	 * Take an extra reference on the base fence that gets dropped when the
 	 * foreign fence is signalled.
 	 */
-	fence_get(&pvr_fence->base);
+	dma_fence_get(&pvr_fence->base);
 
 	spin_lock_irqsave(&fctx->list_lock, flags);
 	list_add_tail(&pvr_fence->fence_head, &fctx->fence_list);
@@ -594,7 +594,7 @@ pvr_fence_create_from_fence(struct pvr_fence_context *fctx,
 			pvr_fence->fence->context, pvr_fence->fence->seqno,
 			name);
 
-	err = fence_add_callback(fence, &pvr_fence->cb,
+	err = dma_fence_add_callback(fence, &pvr_fence->cb,
 				 pvr_fence_foreign_signal_sync);
 	if (err) {
 		if (err != -ENOENT)
@@ -608,7 +608,7 @@ pvr_fence_create_from_fence(struct pvr_fence_context *fctx,
 		PVR_FENCE_TRACE(&pvr_fence->base, "foreign fence %d#%d already signaled (%s)\n",
 				pvr_fence->fence->context, pvr_fence->fence->seqno,
 				name);
-		fence_put(&pvr_fence->base);
+		dma_fence_put(&pvr_fence->base);
 	}
 
 
@@ -638,7 +638,7 @@ pvr_fence_destroy(struct pvr_fence *pvr_fence)
 	PVR_FENCE_TRACE(&pvr_fence->base, "destroyed fence (%s)\n",
 			pvr_fence->name);
 
-	fence_put(&pvr_fence->base);
+	dma_fence_put(&pvr_fence->base);
 }
 
 /**
diff --git a/kernel/drivers/staging/imgtec/pvr_fence.h b/kernel/drivers/staging/imgtec/pvr_fence.h
index e93992c..0b9cb0a 100644
--- a/kernel/drivers/staging/imgtec/pvr_fence.h
+++ b/kernel/drivers/staging/imgtec/pvr_fence.h
@@ -46,7 +46,7 @@ CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #if !defined(__PVR_FENCE_H__)
 #define __PVR_FENCE_H__
 
-#include <linux/fence.h>
+#include <linux/dma-fence.h>
 #include <linux/list.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
@@ -108,17 +108,17 @@ struct pvr_fence_context {
  * @cb: foreign fence callback to set the sync to signalled
  */
 struct pvr_fence {
-	struct fence base;
+	struct dma_fence base;
 	struct pvr_fence_context *fctx;
 	const char *name;
 	int pid;
 
-	struct fence *fence;
+	struct dma_fence *fence;
 	struct PVRSRV_CLIENT_SYNC_PRIM *sync;
 
 	struct list_head fence_head;
 	struct list_head signal_head;
-	struct fence_cb cb;
+	struct dma_fence_cb cb;
 };
 
 enum pvr_fence_sync_val {
@@ -127,22 +127,22 @@ enum pvr_fence_sync_val {
 	PVR_FENCE_SYNC_VAL_DONE = 0xDEADDEAD,
 };
 
-extern const struct fence_ops pvr_fence_ops;
-extern const struct fence_ops pvr_fence_foreign_ops;
+extern const struct dma_fence_ops pvr_fence_ops;
+extern const struct dma_fence_ops pvr_fence_foreign_ops;
 
 static inline bool is_our_fence(struct pvr_fence_context *fctx,
-				struct fence *fence)
+				struct dma_fence *fence)
 {
 	return (fence->context == fctx->fence_context);
 }
 
-static inline bool is_pvr_fence(struct fence *fence)
+static inline bool is_pvr_fence(struct dma_fence *fence)
 {
 	return ((fence->ops == &pvr_fence_ops) ||
 		(fence->ops == &pvr_fence_foreign_ops));
 }
 
-static inline struct pvr_fence *to_pvr_fence(struct fence *fence)
+static inline struct pvr_fence *to_pvr_fence(struct dma_fence *fence)
 {
 	if (is_pvr_fence(fence))
 		return container_of(fence, struct pvr_fence, base);
@@ -157,7 +157,7 @@ void pvr_fence_context_destroy(struct pvr_fence_context *fctx);
 struct pvr_fence *pvr_fence_create(struct pvr_fence_context *fctx,
 				   const char *name);
 struct pvr_fence *pvr_fence_create_from_fence(struct pvr_fence_context *fctx,
-					      struct fence *fence,
+					      struct dma_fence *fence,
 					      const char *name);
 void pvr_fence_destroy(struct pvr_fence *pvr_fence);
 int pvr_fence_sync_sw_signal(struct pvr_fence *pvr_fence);
-- 
2.7.4
